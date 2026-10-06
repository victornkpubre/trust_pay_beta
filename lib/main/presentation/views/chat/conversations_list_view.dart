import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/feedback/error_retry_view.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/services/chat_service.dart';
import 'package:trust_pay_beta/main/presentation/blocs/conversations/conversations_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/chat/chat_display.dart';
import 'package:trust_pay_beta/main/presentation/views/chat/new_group_chat_view.dart';

class ConversationsListView extends StatelessWidget {
  static const String routeName = '/conversations';
  const ConversationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final myUserId = context.read<AppPreferences>().getUser()?.id;
    return BlocProvider(
      create: (context) => ConversationsBloc(context.read<ChatService>())..add(LoadConversations()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(context, NewGroupChatView.routeName),
            ),
          ],
        ),
        body: BlocBuilder<ConversationsBloc, ConversationsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.errorMessage != null) {
              return ErrorRetryView(
                message: state.errorMessage!,
                onRetry: () => context.read<ConversationsBloc>().add(LoadConversations()),
              );
            }
            if (state.conversations.isEmpty) {
              return const Center(child: Text('No messages yet.'));
            }
            return ListView.builder(
              itemCount: state.conversations.length,
              itemBuilder: (context, index) {
                final conversation = state.conversations[index] as Map<String, dynamic>;
                final counterparties = chatCounterparties(conversation, myUserId);
                return ListTile(
                  leading: ChatAvatar(participant: counterparties.isNotEmpty ? counterparties.first : null),
                  title: Text(conversationTitle(conversation, myUserId), overflow: TextOverflow.ellipsis),
                  subtitle: Text(counterparties.map(participantName).join(', '), overflow: TextOverflow.ellipsis),
                  onTap: () => Navigator.pushNamed(context, Routes.groupChatView, arguments: conversation),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
