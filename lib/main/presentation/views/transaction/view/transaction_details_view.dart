import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_details_card.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/buyer_makes_payment.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/payment_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/transaction_details_section.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/transaction_preview_section.dart';

import '../../../../app/routes.dart';

enum TransactionDetailsViewState { acceptance, payment, details }

class TransactionDetailsViewArguments {
  final Transaction transaction;
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
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
            builder: (context, transactionState) {
              Transaction transaction = transactionState.transaction ?? widget.args.transaction;
              TransactionDetailsViewState uiState = widget.args.viewType;
              User? user = userState.user;

              if (transactionState.transaction == null) {
                context.read<TransactionDetailsBloc>()
                    .add(TransactionDetailsEvent.init(transaction));
              }

              return user == null
                  ? Container(
                      color: AppColor.white,
                      child: Center(
                          child: CircularProgressIndicator(
                        color: AppColor.primary,
                      )),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSize.s32, horizontal: AppSize.s16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).viewPadding.top),
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
                              amount: parseAmountDouble(transaction.total),
                              members: transaction.members
                                  .map((t) => t.toUserInput())
                                  .toList()),
                          Expanded(
                            child:
                                uiState == TransactionDetailsViewState.details
                                    ? TransactionDetailsSection(
                                        width: width,
                                        transaction: transaction,
                                        state: transactionState,
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
                                            AppConstants.SERVICE_FEE),
                                        PrimaryButton(
                                            title: 'Make Payment',
                                            active: transaction.status==TransactionStatus.accepted,
                                            onTap: () {
                                              if(transaction.status==TransactionStatus.accepted){
                                                final obligation = getInitialPaymentObligation(transaction, user);
                                                showPaymentModal(
                                                  context,
                                                  transaction,
                                                  (paymentType) async {
                                                    if(obligation!=null){
                                                      final state = context.read<TransactionDetailsBloc>().state;
                                                      context.read<TransactionDetailsBloc>()
                                                          .add(TransactionDetailsEvent.makeTransactionPayment(
                                                          user, obligation, transaction, context, paymentType, state));
                                                    }
                                                  }
                                                );
                                              }
                                              else {
                                                toast(message: "Transaction Not Yet Accepted");
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
                                            title: 'Accept',
                                            onTap: () {

                                        }),
                                        const SizedBox(height: AppSize.s16),
                                        SecondaryButton(
                                            title: 'Reject',
                                            onTap: () {

                                        }),
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
                              const SizedBox(height: AppSize.s4),
                            ],
                          ),
                        ],
                      ),
                    );
            },
          );
        },
      ),
    );
  }
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

buildPaymentDetails(double total, double fee) {
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
            parseAmountDouble(total),
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
            'Service Fee:($fee%)',
            textAlign: TextAlign.center,
            style: appTextGray16,
          ),
          Text(
            parseAmountDouble((total * 0.015)),
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
            parseAmountDouble(total + (total * 0.015).ceil()),
            textAlign: TextAlign.center,
            style: appTextAmber16,
          ),
        ],
      ),
      const SizedBox(height: AppSize.s16),
    ],
  );
}
