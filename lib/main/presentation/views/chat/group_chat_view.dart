import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/feedback/error_retry_view.dart';
import 'package:trust_pay_beta/components/feedback/inline_error_banner.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/services/chat_service.dart';
import 'package:trust_pay_beta/main/presentation/blocs/group_chat/group_chat_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/chat/chat_display.dart';

class GroupChatView extends StatelessWidget {
  static const String routeName = '/group_chat';
  final Map<String, dynamic> conversation;
  const GroupChatView({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    final myUserId = context.read<AppPreferences>().getUser()?.id;
    return BlocProvider(
      create: (context) => GroupChatBloc(
        conversation,
        context.read<ChatService>(),
        context.read<AppPreferences>(),
      )..add(LoadHistory()),
      child: _GroupChatScaffold(myUserId: myUserId),
    );
  }
}

class _GroupChatScaffold extends StatefulWidget {
  final int? myUserId;
  const _GroupChatScaffold({required this.myUserId});

  @override
  State<_GroupChatScaffold> createState() => _GroupChatScaffoldState();
}

class _GroupChatScaffoldState extends State<_GroupChatScaffold> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  void _send(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    context.read<GroupChatBloc>().add(SendGroupMessage(text));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: BlocBuilder<GroupChatBloc, GroupChatState>(
          buildWhen: (previous, current) => previous.conversation != current.conversation,
          builder: (context, state) => _ChatHeader(conversation: state.conversation, myUserId: widget.myUserId),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<GroupChatBloc, GroupChatState>(
              listener: (context, state) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (_scrollController.hasClients) {
                    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                  }
                });
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.errorMessage != null && state.messages.isEmpty) {
                  return ErrorRetryView(
                    message: state.errorMessage!,
                    onRetry: () => context.read<GroupChatBloc>().add(LoadHistory()),
                  );
                }
                final list = ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(12),
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    final isMine = message['sender_id'] == widget.myUserId;
                    return Align(
                      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                        decoration: BoxDecoration(
                          color: isMine ? Colors.blue.shade100 : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(message['body'] as String? ?? ''),
                      ),
                    );
                  },
                );
                if (state.errorMessage == null) return list;
                // Messages already on screen but the live connection dropped.
                return Column(
                  children: [
                    Expanded(child: list),
                    InlineErrorBanner(
                      message: state.errorMessage!,
                      onRetry: () => context.read<GroupChatBloc>().add(LoadHistory()),
                    ),
                  ],
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Message…',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                      onSubmitted: (_) => _send(context),
                    ),
                  ),
                  IconButton(icon: const Icon(Icons.send), onPressed: () => _send(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatHeader extends StatelessWidget {
  final Map<String, dynamic> conversation;
  final int? myUserId;
  const _ChatHeader({required this.conversation, required this.myUserId});

  @override
  Widget build(BuildContext context) {
    final counterparties = chatCounterparties(conversation, myUserId);
    final names = counterparties.map(participantName).where((n) => n.isNotEmpty).join(', ');
    final title = conversationTitle(conversation, myUserId);
    return Row(
      children: [
        ChatAvatar(participant: counterparties.isNotEmpty ? counterparties.first : null, size: 36),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, overflow: TextOverflow.ellipsis),
              if (names.isNotEmpty && names != title)
                Text(names, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
