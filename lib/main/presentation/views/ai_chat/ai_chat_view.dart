import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/feedback/inline_error_banner.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/functions.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/ai_chat/ai_chat_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';

class AiChatView extends StatelessWidget {
  static const String routeName = '/ai_chat';
  const AiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiChatBloc(context.read<AppPreferences>()),
      child: const _AiChatScaffold(),
    );
  }
}

class _AiChatScaffold extends StatefulWidget {
  const _AiChatScaffold();

  @override
  State<_AiChatScaffold> createState() => _AiChatScaffoldState();
}

class _AiChatScaffoldState extends State<_AiChatScaffold> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  bool _creatingTransaction = false;

  void _send(BuildContext context) {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    context.read<AiChatBloc>().add(SendMessage(text));
    _controller.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// How many times in a row a draft has been sent back to the assistant to
  /// fix — stops an endless loop if it keeps producing the same bad draft.
  static const _maxAutoRepairs = 2;
  int _autoRepairs = 0;

  /// A problem with the draft's content: hand it back to the assistant to
  /// recreate correctly, instead of just showing an error.
  void _repairDraft(BuildContext context, String problem) {
    setState(() => _creatingTransaction = false);
    if (_autoRepairs >= _maxAutoRepairs) {
      showErrorSnackBar(context: context, message: 'The draft still has a problem: $problem Please ask the assistant to change it.');
      return;
    }
    _autoRepairs++;
    showSnackBar(context: context, message: 'That draft had a problem — asking the assistant to fix it.');
    context.read<AiChatBloc>().add(RepairDraft(problem));
  }

  /// Checks a draft before anything is sent to the API. Returns the first
  /// content problem found, or null if it looks valid.
  String? _draftProblem(TransactionDraft draft, int currentUserId) {
    if (!draft.memberUserIds.contains(currentUserId)) {
      return 'The current user (id $currentUserId) is not one of the members.';
    }
    if (!TransactionType.values.any((t) => t.name == draft.type)) {
      return "'${draft.type}' is not a valid transaction type.";
    }
    final expiry = DateTime.tryParse(draft.expiryDate);
    if (expiry == null) return "The expiry date '${draft.expiryDate}' is not a valid date.";
    if (!isFutureExpiry(expiry)) return 'The expiry date ${draft.expiryDate} is not in the future.';
    for (final o in draft.obligations) {
      if (!draft.memberUserIds.contains(o.bindingUserId)) {
        return "Obligation '${o.title}' is bound to user ${o.bindingUserId}, who is not a member.";
      }
      if (!ObligationType.values.any((t) => t.name == o.type)) {
        return "Obligation '${o.title}' has an invalid type '${o.type}'.";
      }
      if (DateTime.tryParse(o.dueDate) == null) {
        return "Obligation '${o.title}' has an invalid due date '${o.dueDate}'.";
      }
    }
    return null;
  }

  Future<void> _confirmDraft(BuildContext context, TransactionDraft draft) async {
    setState(() => _creatingTransaction = true);
    try {
      final remoteDataSource = context.read<RemoteDataSource>();
      final currentUser = context.read<AppPreferences>().getUser();
      if (currentUser == null) {
        throw Exception('Could not determine the current user.');
      }

      // Check phase 1: the draft's own content.
      final problem = _draftProblem(draft, currentUser.id!);
      if (problem != null) {
        _repairDraft(context, problem);
        return;
      }

      // Check phase 2: every member must be a real user.
      final members = <User>[];
      final lookups = await Future.wait(draft.memberUserIds.map((id) async {
        try {
          final response = await remoteDataSource.getUser(id);
          return (id, response.status == 200 ? response.toDomain() : null);
        } on DioException catch (e) {
          if (e.type == DioExceptionType.badResponse) return (id, null);
          rethrow; // no connection etc. — handled below with Retry
        }
      }));
      for (final (id, user) in lookups) {
        if (user == null) {
          if (!context.mounted) return;
          _repairDraft(context, 'No user exists with id $id.');
          return;
        }
        members.add(user);
      }

      final type = TransactionType.values.byName(draft.type);
      final obligations = draft.obligations
          .map((o) => Obligation(
                title: o.title,
                status: ObligationStatus.pending,
                type: ObligationType.values.byName(o.type),
                dueDate: DateTime.parse(o.dueDate),
                amount: o.amount,
                binding: o.bindingUserId,
              ))
          .toList();

      final transaction = Transaction(
        userId: currentUser.id,
        title: draft.title,
        type: type,
        total: draft.total,
        currency: draft.currency,
        dateCreated: DateTime.now(),
        expiryDate: DateTime.parse(draft.expiryDate),
        percentageComplete: 0,
        status: TransactionStatus.pending,
        obligations: obligations,
        members: members,
      );

      if (!context.mounted) return;
      final transactionBloc = context.read<TransactionBloc>();
      late final StreamSubscription subscription;
      subscription = transactionBloc.stream.listen((state) {
        if (state.status == TransactionBlocStatus.transactionCreated && state.transaction != null) {
          subscription.cancel();
          _autoRepairs = 0;
          if (!context.mounted) return;
          initialNotification(context, state.transaction!, state);
          Navigator.pushReplacementNamed(
            context,
            Routes.transactionsDetails,
            arguments: TransactionDetailsViewArguments(
              transaction: state.transaction!,
              viewType: TransactionDetailsViewState.details,
            ),
          );
        } else if (state.status == TransactionBlocStatus.error) {
          subscription.cancel();
          if (!context.mounted) return;
          final message = state.message ?? ErrorMessages.unknown;
          if (isRetryableMessage(message)) {
            // Connection/server trouble — the draft itself may be fine.
            setState(() => _creatingTransaction = false);
            showErrorSnackBar(context: context, message: message, onRetry: () => _confirmDraft(context, draft));
          } else {
            // Check phase 3: the API rejected the draft's content.
            _repairDraft(context, message);
          }
        }
      });
      transactionBloc.add(TransactionEvent.createTransaction(transaction, transactionBloc.state, null));
    } catch (e) {
      if (!context.mounted) return;
      setState(() => _creatingTransaction = false);
      showErrorSnackBar(
        context: context,
        message: friendlyErrorMessage(e),
        onRetry: () => _confirmDraft(context, draft),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s8),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text('AI Support', style: appTextBlack20Bold),
                  ),
                  const Positioned(
                    top: 2,
                    left: 0,
                    child: AppBackButton(size: AppSize.s16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<AiChatBloc, AiChatState>(
                builder: (context, state) {
                  if (state.messages.isEmpty) {
                    return Center(
                      child: Text('Ask TrustPay support anything.', style: appTextGray16),
                    );
                  }
                  final list = ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s8),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      final isUser = message.role == 'user';
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSize.s4),
                        child: Column(
                          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                          children: [
                            if (isUser)
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s10),
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                                  decoration: BoxDecoration(
                                    color: AppColor.secondary,
                                    borderRadius: BorderRadius.circular(AppSize.s16),
                                  ),
                                  child: Text(
                                    message.text, 
                                    style: appTextGray16,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.only(right: AppSize.s16),
                                child: Text(
                                  message.text.isEmpty ? '…' : message.text,
                                  style: appTextGray16,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                            if (message.draft != null) ...[
                              const SizedBox(height: AppSize.s10),
                              _TransactionDraftCard(
                                draft: message.draft!,
                                loading: _creatingTransaction,
                                onContinue: () => _confirmDraft(context, message.draft!),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  );
                  if (state.errorMessage == null) return list;
                  // Keep the conversation on screen; the failed reply gets Retry.
                  return Column(
                    children: [
                      Expanded(child: list),
                      InlineErrorBanner(
                        message: state.errorMessage!,
                        onRetry: () => context.read<AiChatBloc>().add(RetryLastMessage()),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSize.s16, AppSize.s8, AppSize.s16, AppSize.s16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s4),
                      decoration: ShapeDecoration(
                        color: AppColor.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: AppColor.fontBlack),
                          borderRadius: BorderRadius.circular(AppSize.s32),
                        ),
                        shadows: [boxShadowOne],
                      ),
                      child: TextField(
                        controller: _controller,
                        style: appTextBlack16Bold,
                        decoration: InputDecoration(
                          hintText: 'Type a message…',
                          hintStyle: appTextGray16,
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onSubmitted: (_) => _send(context),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.s8),
                  InkWell(
                    onTap: () => _send(context),
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(color: AppColor.primary, shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionDraftCard extends StatelessWidget {
  final TransactionDraft draft;
  final bool loading;
  final VoidCallback onContinue;

  const _TransactionDraftCard({required this.draft, required this.loading, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final otherMemberCount = draft.memberUserIds.length - 1;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSize.s16),
      decoration: ShapeDecoration(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColor.borderGray),
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        shadows: [boxShadowOne],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(draft.title, style: appTextBlack16Bold),
          if (otherMemberCount > 0) ...[
            const SizedBox(height: AppSize.s4),
            Text(
              'With $otherMemberCount other ${otherMemberCount == 1 ? 'person' : 'people'}',
              style: appTextGray14,
            ),
          ],
          const SizedBox(height: AppSize.s16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Obligations', style: appTextGray12),
                    Text('${draft.obligations.length}', style: appTextBlack16Bold),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount', style: appTextGray12),
                    Text('${currencySymbolFor(draft.currency)}${draft.total.toStringAsFixed(0)}', style: appTextBlack16Bold),
                  ],
                ),
              ),
              PrimaryButton(
                title: loading ? 'Please wait…' : 'Continue',
                width: 120,
                active: !loading,
                onTap: loading ? () {} : onContinue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
