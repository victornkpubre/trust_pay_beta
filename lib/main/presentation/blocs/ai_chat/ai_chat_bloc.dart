import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';

// Plain (non-freezed) bloc, unlike auth_bloc.dart — this is a small,
// self-contained feature and freezed's codegen step isn't worth it here.
// If this bloc grows more event/state variants, consider switching for
// consistency with the rest of the app.

sealed class AiChatEvent {}

class SendMessage extends AiChatEvent {
  final String text;
  SendMessage(this.text);
}

/// Re-sends the last user message after a failed reply, replacing the
/// failed exchange rather than adding a duplicate of it.
class RetryLastMessage extends AiChatEvent {}

// Mirrors the JSON shape trust_pay_ai's propose_transaction tool echoes back
// (see trust_pay_ai/application/agents/graphs/tools/transaction_draft_tool.py).
// This is only ever a draft — nothing gets created until the user taps
// Continue, which builds a real Transaction from this and goes through the
// same TransactionBloc.createTransaction path every create screen uses.
class TransactionDraftObligation {
  final String title;
  final String type;
  final String dueDate;
  final double amount;
  final int bindingUserId;

  const TransactionDraftObligation({
    required this.title,
    required this.type,
    required this.dueDate,
    required this.amount,
    required this.bindingUserId,
  });

  factory TransactionDraftObligation.fromJson(Map<String, dynamic> json) => TransactionDraftObligation(
        title: json['title'] as String,
        type: json['type'] as String,
        dueDate: json['due_date'] as String,
        amount: (json['amount'] as num).toDouble(),
        bindingUserId: json['binding_user_id'] as int,
      );
}

class TransactionDraft {
  final String title;
  final String type;
  final double total;
  final String currency;
  final String expiryDate;
  final List<int> memberUserIds;
  final List<TransactionDraftObligation> obligations;

  const TransactionDraft({
    required this.title,
    required this.type,
    required this.total,
    this.currency = 'NGN',
    required this.expiryDate,
    required this.memberUserIds,
    required this.obligations,
  });

  factory TransactionDraft.fromJson(Map<String, dynamic> json) => TransactionDraft(
        title: json['title'] as String,
        type: json['type'] as String,
        total: (json['total'] as num).toDouble(),
        currency: (json['currency'] as String?) ?? 'NGN',
        expiryDate: json['expiry_date'] as String,
        memberUserIds: (json['member_user_ids'] as List).map((e) => e as int).toList(),
        obligations: (json['obligations'] as List)
            .map((e) => TransactionDraftObligation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class AiChatMessage {
  final String role; // 'user' | 'assistant'
  final String text;
  final TransactionDraft? draft;
  const AiChatMessage({required this.role, required this.text, this.draft});

  AiChatMessage copyWith({String? text, TransactionDraft? draft}) =>
      AiChatMessage(role: role, text: text ?? this.text, draft: draft ?? this.draft);
}

class AiChatState {
  final List<AiChatMessage> messages;
  final bool isStreaming;
  final String? errorMessage;

  const AiChatState({
    this.messages = const [],
    this.isStreaming = false,
    this.errorMessage,
  });

  AiChatState copyWith({
    List<AiChatMessage>? messages,
    bool? isStreaming,
    String? errorMessage,
  }) =>
      AiChatState(
        messages: messages ?? this.messages,
        isStreaming: isStreaming ?? this.isStreaming,
        errorMessage: errorMessage,
      );
}

class AiChatBloc extends Bloc<AiChatEvent, AiChatState> {
  final AppPreferences appPreferences;
  final String _threadId = DateTime.now().millisecondsSinceEpoch.toString();
  final Dio _dio = Dio();

  AiChatBloc(this.appPreferences) : super(const AiChatState()) {
    on<SendMessage>(_onSendMessage);
    on<RetryLastMessage>(_onRetryLastMessage);
  }

  Future<void> _onRetryLastMessage(RetryLastMessage event, Emitter<AiChatState> emit) async {
    final lastUserIndex = state.messages.lastIndexWhere((m) => m.role == 'user');
    if (lastUserIndex == -1) return;
    final text = state.messages[lastUserIndex].text;
    emit(state.copyWith(messages: state.messages.sublist(0, lastUserIndex)));
    await _onSendMessage(SendMessage(text), emit);
  }

  Future<void> _onSendMessage(SendMessage event, Emitter<AiChatState> emit) async {
    final token = await appPreferences.getAccessToken();

    final userMessage = AiChatMessage(role: 'user', text: event.text);
    const assistantMessage = AiChatMessage(role: 'assistant', text: '');
    emit(state.copyWith(
      messages: [...state.messages, userMessage, assistantMessage],
      isStreaming: true,
      errorMessage: null,
    ));

    try {
      final response = await _dio.post<ResponseBody>(
        '${AppConstants.aiBaseUrl}/chat',
        data: {'thread_id': _threadId, 'message': event.text},
        options: Options(
          responseType: ResponseType.stream,
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      var buffer = '';
      var accumulatedText = '';
      await for (final chunk in response.data!.stream) {
        buffer += utf8.decode(chunk, allowMalformed: true);
        final lines = buffer.split('\n');
        buffer = lines.removeLast(); // keep any partial last line for next chunk

        for (final line in lines) {
          if (!line.startsWith('data: ')) continue;
          final payload = jsonDecode(line.substring(6)) as Map<String, dynamic>;
          switch (payload['type']) {
            case 'token':
              accumulatedText += payload['content'] as String;
              _emitAssistantText(emit, accumulatedText, streaming: true);
              break;
            case 'transaction_draft':
              _attachDraft(emit, TransactionDraft.fromJson(payload['draft'] as Map<String, dynamic>));
              break;
            case 'error':
              debugPrint('[AiChat] thread=$_threadId error: ${payload['message']}. Partial text: $accumulatedText');
              emit(state.copyWith(isStreaming: false, errorMessage: payload['message'] as String?));
              return;
            case 'done':
              debugPrint('[AiChat] thread=$_threadId full response: $accumulatedText');
              _emitAssistantText(emit, accumulatedText, streaming: false);
              return;
          }
        }
      }
      // Stream ended without an explicit "done" event.
      debugPrint('[AiChat] thread=$_threadId stream closed without done: $accumulatedText');
      _emitAssistantText(emit, accumulatedText, streaming: false);
    } catch (e) {
      emit(state.copyWith(isStreaming: false, errorMessage: friendlyErrorMessage(e)));
    }
  }

  void _emitAssistantText(Emitter<AiChatState> emit, String text, {required bool streaming}) {
    final updated = [...state.messages];
    updated[updated.length - 1] = updated.last.copyWith(text: text);
    emit(state.copyWith(messages: updated, isStreaming: streaming));
  }

  void _attachDraft(Emitter<AiChatState> emit, TransactionDraft draft) {
    final updated = [...state.messages];
    updated[updated.length - 1] = updated.last.copyWith(draft: draft);
    emit(state.copyWith(messages: updated));
  }
}
