import 'package:flutter/material.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:provider/provider.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/data/services/chat_service.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

/// Navigator arguments for [NewGroupChatView.routeName] — mirrors the
/// TransactionDetailsViewArguments pattern used elsewhere in routes.dart.
class NewGroupChatViewArguments {
  final List<User> preselectedParticipants;
  final int? transactionId;
  final String? title;
  const NewGroupChatViewArguments({this.preselectedParticipants = const [], this.transactionId, this.title});
}

/// Ad-hoc "new group chat" flow (Stage 7) — search users via the existing
/// users/search endpoint, multi-select, create. Also used by the
/// group-transaction hook (see create_money_pool.dart etc.), which
/// pre-fills [preselectedParticipants] and [transactionId] instead of
/// starting from an empty search.
class NewGroupChatView extends StatefulWidget {
  static const String routeName = '/new_group_chat';
  final List<User> preselectedParticipants;
  final int? transactionId;
  final String? title;

  const NewGroupChatView({
    super.key,
    this.preselectedParticipants = const [],
    this.transactionId,
    this.title,
  });

  @override
  State<NewGroupChatView> createState() => _NewGroupChatViewState();
}

class _NewGroupChatViewState extends State<NewGroupChatView> {
  final _searchController = TextEditingController();
  List<User> _results = [];
  late final Set<int> _selectedIds;
  bool _isSearching = false;
  bool _isCreating = false;

  @override
  void initState() {
    super.initState();
    _selectedIds = widget.preselectedParticipants.map((u) => u.id!).toSet();
  }

  Future<void> _search(String text) async {
    if (text.trim().isEmpty) {
      setState(() => _results = []);
      return;
    }
    setState(() => _isSearching = true);
    try {
      final remoteDataSource = context.read<RemoteDataSource>();
      final response = await remoteDataSource.searchUser(text, 20, 1);
      setState(() => _results = response.toDomain());
    } catch (_) {
      setState(() => _results = []);
    } finally {
      setState(() => _isSearching = false);
    }
  }

  Future<void> _create(BuildContext context) async {
    if (_selectedIds.isEmpty) return;
    setState(() => _isCreating = true);
    try {
      final chatService = context.read<ChatService>();
      final conversation = await chatService.createConversation(
        participantIds: _selectedIds.toList(),
        transactionId: widget.transactionId,
        title: widget.title,
      );
      if (!context.mounted) return;
      Navigator.pushReplacementNamed(
        context,
        Routes.groupChatView,
        arguments: conversation,
      );
    } catch (e) {
      if (context.mounted) {
        showErrorSnackBar(context: context, message: chatErrorMessage(e), onRetry: () => _create(context));
      }
    } finally {
      if (mounted) setState(() => _isCreating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New group chat')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users to add…',
                border: const OutlineInputBorder(),
                suffixIcon: _isSearching ? const Padding(padding: EdgeInsets.all(10), child: CircularProgressIndicator(strokeWidth: 2)) : null,
              ),
              onChanged: _search,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final user = _results[index];
                final selected = _selectedIds.contains(user.id);
                return CheckboxListTile(
                  value: selected,
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  onChanged: (checked) {
                    setState(() {
                      if (checked == true) {
                        _selectedIds.add(user.id!);
                      } else {
                        _selectedIds.remove(user.id);
                      }
                    });
                  },
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedIds.isEmpty || _isCreating ? null : () => _create(context),
                  child: _isCreating
                      ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                      : Text('Create group (${_selectedIds.length} selected)'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
