import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/popups/flows/payment_flow_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

import '../../../app/routes.dart';
import '../transaction/view/transaction_details_view.dart';

void showPaymentModal(context, Transaction transaction, Function(PaymentType) onSubmit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return PaymentFlowPopup(
          width: MediaQuery.of(context).size.width,
          amount: parseAmountDouble(transaction.total),
          onSubmit: (type){
            onSubmit(type);
          },
          onReview: () {
            Navigator.pushNamed(
                context,
                Routes.transactionsDetails,
                arguments: TransactionDetailsViewArguments(
                    transaction: transaction,
                    viewType: TransactionDetailsViewState.details
                )
            );
          },
          onHome: () {
            Navigator.of(context).pushReplacementNamed(Routes.home);
          }
      );
    },
  );
}