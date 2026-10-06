import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/popups/flows/payment_flow_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

import '../../../app/routes.dart';
import '../transaction/view/transaction_details_view.dart';

void showPaymentModal(context, PaymentMode paymentMode, Transaction? transaction, Function(PaymentType) onSubmit, double? amount) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      final resolvedAmount = amount ?? transaction?.total ?? 0;
      return PaymentFlowPopup(
          width: MediaQuery.of(context).size.width,
          paymentMode: paymentMode,
          amount: parseAmountDouble(resolvedAmount),
          rawAmount: resolvedAmount,
          transaction: transaction,
          onSubmit: (type) {
            onSubmit(type);
          },
          onReview: () {
            if(transaction!=null) {
              Navigator.pushNamed(
                  context,
                  Routes.transactionsDetails,
                  arguments: TransactionDetailsViewArguments(
                      transaction: transaction,
                      viewType: TransactionDetailsViewState.details
                  )
              );
            }
          },
          onHome: () {
            Navigator.of(context).pushReplacementNamed(Routes.home);
          }
      );
    },
  );
}