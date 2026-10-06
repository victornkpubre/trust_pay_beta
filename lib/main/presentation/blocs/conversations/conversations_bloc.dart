import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/services/chat_service.dart';

sealed class ConversationsEvent {}

class LoadConversations extends ConversationsEvent {}

class ConversationsState {
  final List<dynamic> conversations;
  final bool isLoading;
  final String? errorMessage;

  const ConversationsState({
    this.conversations = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  ConversationsState copyWith({
    List<dynamic>? conversations,
    bool? isLoading,
    String? errorMessage,
  }) =>
      ConversationsState(
        conversations: conversations ?? this.conversations,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
      );
}

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  final ChatService chatService;

  ConversationsBloc(this.chatService) : super(const ConversationsState()) {
    on<LoadConversations>(_onLoad);
  }

  Future<void> _onLoad(LoadConversations event, Emitter<ConversationsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final conversations = await chatService.listConversations();
      emit(state.copyWith(conversations: conversations, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: chatErrorMessage(e)));
    }
  }
}
