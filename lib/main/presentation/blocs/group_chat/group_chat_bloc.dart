import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/services/chat_service.dart';

sealed class GroupChatEvent {}

class LoadHistory extends GroupChatEvent {}

class SendGroupMessage extends GroupChatEvent {
  final String body;
  SendGroupMessage(this.body);
}

/// Internal — fired by the WebSocket listener, not called directly.
class _MessageReceived extends GroupChatEvent {
  final Map<String, dynamic> message;
  _MessageReceived(this.message);
}

/// Internal — fired by the WebSocket's onError, not called directly. Routed
/// through add() rather than calling emit() straight from the stream
/// callback: emit() is only safe inside a registered event handler, and
/// calling it from an arbitrary async callback risks emitting after the
/// bloc has already closed (the same class of bug fixed earlier in
/// AuthBloc's GoogleLogin handler).
class _ConnectionError extends GroupChatEvent {
  final String message;
  _ConnectionError(this.message);
}

class GroupChatState {
  /// ConversationResource JSON — participants and transaction drive the
  /// header. Starts as whatever the opener passed (possibly just id/title)
  /// and is replaced by the full record once LoadHistory fetches it.
  final Map<String, dynamic> conversation;
  final List<Map<String, dynamic>> messages;
  final bool isLoading;
  final String? errorMessage;

  const GroupChatState({required this.conversation, this.messages = const [], this.isLoading = false, this.errorMessage});

  GroupChatState copyWith({Map<String, dynamic>? conversation, List<Map<String, dynamic>>? messages, bool? isLoading, String? errorMessage}) =>
      GroupChatState(
        conversation: conversation ?? this.conversation,
        messages: messages ?? this.messages,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
      );
}

/// One instance per open conversation screen. Loads history over REST
/// (Stage 5's endpoints), then keeps a live WebSocket (Stage 6) open for
/// real-time delivery — sent messages aren't added to state directly, they
/// come back through the same socket once Laravel has persisted them
/// (see ws_chat.py's server-side broadcast-to-sender behavior), so every
/// client (including this one) renders from one canonical source.
class GroupChatBloc extends Bloc<GroupChatEvent, GroupChatState> {
  final int conversationId;
  final ChatService chatService;
  final AppPreferences appPreferences;
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  bool _socketFailed = false;

  GroupChatBloc(Map<String, dynamic> conversation, this.chatService, this.appPreferences)
      : conversationId = conversation['id'] as int,
        super(GroupChatState(conversation: conversation)) {
    on<LoadHistory>(_onLoadHistory);
    on<SendGroupMessage>(_onSend);
    on<_MessageReceived>(_onMessageReceived);
    on<_ConnectionError>(_onConnectionError);
    _connect();
  }

  Future<void> _onLoadHistory(LoadHistory event, Emitter<GroupChatState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    // A Retry after a dropped socket should bring live delivery back too.
    if (_socketFailed) {
      _socketFailed = false;
      await _subscription?.cancel();
      await _channel?.sink.close();
      _connect();
    }
    try {
      // Header details are nice-to-have — if they fail (e.g. an older API
      // without GET conversations/{id}), still show the messages.
      final detailsFuture = chatService
          .getConversation(conversationId)
          .then<Map<String, dynamic>?>((d) => d)
          .catchError((_) => null);
      final history = await chatService.fetchMessages(conversationId);
      final details = await detailsFuture ?? const {};
      final messages = history.cast<Map<String, dynamic>>().toList().reversed.toList();
      emit(state.copyWith(conversation: {...state.conversation, ...details}, messages: messages, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: chatErrorMessage(e)));
    }
  }

  Future<void> _connect() async {
    final token = await appPreferences.getAccessToken();
    final uri = Uri.parse('${AppConstants.aiWsBaseUrl}/ws/conversations/$conversationId?token=$token');
    _channel = WebSocketChannel.connect(uri);
    _subscription = _channel!.stream.listen(
      (raw) {
        final message = jsonDecode(raw as String) as Map<String, dynamic>;
        add(_MessageReceived(message));
      },
      onError: (e) => add(_ConnectionError(chatErrorMessage(e))),
    );
  }

  void _onMessageReceived(_MessageReceived event, Emitter<GroupChatState> emit) {
    emit(state.copyWith(messages: [...state.messages, event.message]));
  }

  void _onConnectionError(_ConnectionError event, Emitter<GroupChatState> emit) {
    _socketFailed = true;
    emit(state.copyWith(errorMessage: event.message));
  }

  void _onSend(SendGroupMessage event, Emitter<GroupChatState> emit) {
    _channel?.sink.add(jsonEncode({'body': event.body}));
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _channel?.sink.close();
    return super.close();
  }
}
