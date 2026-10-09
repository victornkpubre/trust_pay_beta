import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_details_card.dart';
import 'package:trust_pay_beta/components/popups/flows/proof_gallery_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/transaction_rejection_popup.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/services/chat_service.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/accept_transaction_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/decline_transaction_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/payment_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/transaction_details_section.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/transaction_preview_section.dart';

import '../../../../app/routes.dart';

enum TransactionDetailsViewState { acceptance, payment, details }

class TransactionDetailsViewArguments {
  final Transaction? transaction;
  final TransactionDetailsViewState viewType;
  TransactionDetailsViewArguments(
      {required this.transaction, required this.viewType});
}

class TransactionDetailsView extends StatefulWidget {
  static const String routeName = '/transaction/details';
  final TransactionDetailsViewArguments args;
  const TransactionDetailsView({
    super.key,
    required this.args,
  });

  @override
  State<TransactionDetailsView> createState() => _TransactionDetailsViewState();
}

class _TransactionDetailsViewState extends State<TransactionDetailsView> {
  // Adding a proof updates the transaction in a bottom sheet that doesn't
  // route back through any bloc — this is the only way this screen learns
  // about it without a full re-fetch. Takes priority over widget.args.transaction
  // (a snapshot from whenever this screen was opened) once set.
  Transaction? _locallyUpdatedTransaction;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<TransactionBloc, TransactionBlocState>(
        builder: (context, transactionState) {

          return BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              return BlocConsumer<TransactionDetailsBloc, TransactionDetailsState>(
                listener: (context, transactionDetailsState) {

                  if(transactionDetailsState.state==TransactionDetailsBlocStatus.error && isScreenOnTop(context)) {
                    showErrorSnackBar(
                        context: context,
                        message: transactionDetailsState.errorMessage,
                        onRetry: () => context.read<TransactionDetailsBloc>().retry(),
                    );
                  }

                  if(transactionDetailsState.state==TransactionDetailsBlocStatus.transactionUpdated
                  && widget.args.viewType==TransactionDetailsViewState.acceptance) {
                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.home, (Route<dynamic> route) => false);
                  }
                },
                builder: (context, transactionDetailsState) {
                  Transaction? transaction = _locallyUpdatedTransaction ?? widget.args.transaction ?? transactionDetailsState.transaction;
                  TransactionDetailsViewState uiState = widget.args.viewType;
                  User? user = userState.user;

                  // Skip once a proof was just added locally — liveTransactions
                  // comes from an earlier fetch and would overwrite it with a
                  // stale (pre-proof) copy otherwise.
                  if(_locallyUpdatedTransaction == null && transactionState.status == TransactionBlocStatus.userHistoryLoaded) {
                    final index = transactionState.liveTransactions?.indexWhere((t) => t.id==transaction?.id);
                    if(transaction?.id != null && index!=null && index!=-1) {
                      transaction = transactionState.liveTransactions?[index];
                    }
                  }

                  if(user == null) {
                    context.read<UserBloc>().add(UserEvent.currentUser(userState));
                  }

                  return user == null || transaction == null || transactionDetailsState.state==TransactionDetailsBlocStatus.loading?
                  Container(
                      color: AppColor.white,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColor.primary,
                      )),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(vertical: AppSize.s32, horizontal: AppSize.s16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: MediaQuery.of(context).viewPadding.top),
                          Stack(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppSize.s4),
                                  child: Row(
                                    children: [
                                      AppBackButton(size: AppSize.s16),
                                    ],
                                  )),
                              Positioned.fill(
                                  child: Center(
                                child: Text('Transaction Details',
                                    style: appTextBlack20Bold),
                              )),
                            ],
                          ),
                          const SizedBox(height: AppSize.s8),
                          TransactionDetailsCard(
                              title: transaction.title,
                              width: width,
                              date: transaction.expiryDate,
                              type: transaction.type,
                              status: transaction.status,
                              amount: parseAmountDouble(transaction.total, transaction.currency),
                              members: transaction.members.map((t) => t.toUserInput()).toList()
                          ),
                          Expanded(
                            child:
                                uiState == TransactionDetailsViewState.details
                                    ? TransactionDetailsSection(
                                        width: width,
                                        transaction: transaction,
                                        state: transactionDetailsState,
                                      )
                                    : TransactionDetailsPreviewSection(
                                        width: width,
                                        state: uiState,
                                        transaction: transaction,
                                        currentUser: user,
                                      ),
                          ),
                          Column(
                            children: [
                              uiState == TransactionDetailsViewState.payment
                                  ? Column(
                                      children: [
                                        Divider(
                                            color: AppColor.primary,
                                            thickness: 1),
                                        buildPaymentDetails(
                                            _getUserAmount(user, transaction),
                                            AppConstants.SERVICE_FEE,
                                            transaction.currency),
                                        PrimaryButton(
                                            title: 'Make Payment',
                                            active: transaction.status==TransactionStatus.accepted,
                                            onTap: () {
                                              if(transaction!.status==TransactionStatus.accepted) {
                                                final obligation = getInitialPaymentObligation(transaction, user);
                                                showPaymentModal(
                                                  context,
                                                  PaymentMode.payOut,
                                                  transaction,
                                                  (paymentType) async {
                                                    if(obligation!=null) {
                                                      final state = context.read<TransactionDetailsBloc>().state;
                                                      context.read<TransactionDetailsBloc>()
                                                          .add(TransactionDetailsEvent.makeTransactionPayment(
                                                          user, obligation, transaction!, context, paymentType, state));
                                                    }
                                                  },
                                                  obligation?.amount
                                                );
                                              }
                                              else {
                                                showSnackBar(context: context, message: "Transaction Not Yet Accepted");
                                              }
                                            }),
                                        const SizedBox(height: AppSize.s16),
                                        SecondaryButton(
                                            title: 'Back',
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            }),
                                      ],
                                    )
                                  : Container(),
                              uiState == TransactionDetailsViewState.acceptance
                                  ? Column(
                                      children: [
                                        PrimaryButton(
                                            active: transaction.status==TransactionStatus.pending,
                                            title: 'Accept',
                                            onTap: () {
                                              final state = context.read<TransactionDetailsBloc>().state;
                                              context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.acceptTransaction(userState.user!, transaction!, context, state));
                                            }
                                        ),
                                        const SizedBox(height: AppSize.s16),
                                        SecondaryButton(
                                            title: 'Reject',
                                            onTap: () {
                                              if(transaction?.status==TransactionStatus.pending) {
                                                final owner = transaction?.members.firstWhere((u) =>u.id==transaction?.userId);
                                                final state = context.read<TransactionDetailsBloc>().state;

                                                showDeclineTransactionModal(
                                                  context,
                                                  transaction!,
                                                  owner!,
                                                  TransactionRejectionPopupState.confirming,
                                                  (note){
                                                    if(note!=null && note.isNotEmpty){
                                                      context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.declineTransaction(userState.user!, note, transaction!, context, state));
                                                    }
                                                    else {
                                                      showSnackBar(context: context, message: 'A reason for the rejection is required');
                                                    }
                                                  }
                                                );
                                              }
                                            }
                                        ),
                                      ],
                                    )
                                  : Container(),
                              uiState == TransactionDetailsViewState.details
                                  ? Column(
                                      children: [
                                        transaction.type ==
                                                TransactionType.billSplitter
                                            ? PrimaryButton(
                                                title: 'Pay Payee',
                                                onTap: () {})
                                            : Container(),
                                        const SizedBox(height: AppSize.s16),
                                        SecondaryButton(
                                          title: 'Back',
                                          onTap: () {
                                            Navigator.of(context).pushReplacementNamed(Routes.home);
                                          }),
                                      ],
                                    )
                                  : Container(),
                              const SizedBox(height: AppSize.s16),
                              SecondaryButton(
                                  title: proofSuggested(transaction, user)
                                      ? 'Add Photo/Video Proof (suggested)'
                                      : 'Photo/Video Proof (${transaction.proofs.length})',
                                  onTap: () => showProofGalleryModal(
                                    context,
                                    transaction!,
                                    onUpdated: (t) => setState(() => _locallyUpdatedTransaction = t),
                                  )),
                              const SizedBox(height: AppSize.s16),
                              PrimaryButton(
                                  title: 'Open Chat',
                                  onTap: () => _openChat(context, transaction!)),
                              const SizedBox(height: AppSize.s4),
                            ],
                          ),
                        ],
                      ),
                    );
                },
              );
            },
          );
        }
      ),
    );
  }

  Future<void> _openChat(BuildContext context, Transaction transaction) async {
    // Members are passed along so the chat header can show the counterparty
    // straight away, before GroupChatView fetches the full conversation.
    Map<String, dynamic> conversation = {
      'id': transaction.conversationId,
      'title': transaction.title,
      'transaction': {'id': transaction.id, 'title': transaction.title},
      'participants': transaction.members.map((m) => {
            'id': m.id,
            'first_name': m.firstName,
            'last_name': m.lastName,
            'profile_image': m.profileImage,
            'business_name': m.businessName,
          }).toList(),
    };

    if (transaction.conversationId == null) {
      try {
        conversation = await context.read<ChatService>().createConversation(
              participantIds: transaction.members.map((m) => m.id!).toList(),
              transactionId: transaction.id,
              title: transaction.title,
            );
      } catch (e) {
        if (context.mounted) {
          showErrorSnackBar(context: context, message: chatErrorMessage(e), onRetry: () => _openChat(context, transaction));
        }
        return;
      }
    }

    if (context.mounted) {
      Navigator.pushNamed(context, Routes.groupChatView, arguments: conversation);
    }
  }
}

/// Whether [user] owes a delivery/attendance that has no photo/video proof yet.
bool proofSuggested(Transaction transaction, User user) {
  return transaction.obligations.any((o) =>
      o.type.isFulfilment
      && o.binding == user.id
      && (o.status == ObligationStatus.pending || o.status == ObligationStatus.fulfilled)
      && transaction.proofsFor(o.id).isEmpty);
}

Obligation? getInitialPaymentObligation(Transaction transaction, User user) {
  switch (transaction.type) {
    case TransactionType.secureSales:
      return transaction.obligations.firstWhere((o) => o.type==ObligationType.payment);
    case TransactionType.billSplitter:
      return transaction.obligations.firstWhere((o) => o.type==ObligationType.payment && o.binding==user.id);
    case TransactionType.betsWagers:
      return transaction.obligations.firstWhere((o) => o.type==ObligationType.payment && o.binding==user.id);
    case TransactionType.groupGoals:
      return null;
    case TransactionType.moneyPool:
      final obligations = transaction.obligations.map((o) {
        if(o.type==ObligationType.payment&&o.binding==user.id) {
          return o;
        }
      }).toList();

      return obligations.reduce((a, b) => a?.dueDate.isBefore(b?.dueDate??DateTime.now())??false ? a : b);
    default:
      return null;
  }
}

double _getUserAmount(User user, Transaction transaction) {
  switch (transaction.type) {
    case TransactionType.secureSales:
      return transaction.total;
    case TransactionType.billSplitter:
      return transaction.obligations.firstWhere((obligation) {
        return obligation.binding!.compareTo(user.id!) == 0 &&
            obligation.type == ObligationType.payment;
      }).amount;
    case TransactionType.betsWagers:
      return transaction.total;
    case TransactionType.groupGoals:
      return transaction.obligations.firstWhere((obligation) {
        return obligation.binding!.compareTo(user.id!) == 0 &&
            obligation.type == ObligationType.payment;
      }).amount;
    case TransactionType.moneyPool:
      return transaction.obligations.firstWhere((obligation) {
        return obligation.binding!.compareTo(user.id!) == 0 &&
            obligation.type == ObligationType.payment;
      }).amount;
    default:
      return transaction.total;
  }
}

buildPaymentDetails(double total, double fee, [String currency = 'NGN']) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Amount',
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            parseAmountDouble(total, currency),
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Service Fee:(${(fee * 100).toStringAsFixed(1)}%)',
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            parseAmountDouble(total * fee, currency),
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Amount',
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            parseAmountDouble(total * (1 + fee), currency),
            textAlign: TextAlign.center,
            style: appTextAmber16,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s16),
    ],
  );
}
