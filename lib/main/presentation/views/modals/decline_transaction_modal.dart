import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/popups/flows/payment_flow_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/transaction_rejection_popup.dart';
import 'package:trust_pay_beta/components/popups/reject_transaction_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

import '../../../app/routes.dart';
import '../transaction/view/transaction_details_view.dart';


void showDeclineTransactionModal(context, Transaction transaction, User owner, TransactionRejectionPopupState? initState, Function(String?) onDecline) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return TransactionRejectionPopup(
        width: MediaQuery.of(context).size.width,
        amount: transaction.total,
        transactionTitle: transaction.title,
        expiryDate: transaction.expiryDate,
        transactionDetails: "${transaction.title} with ${owner.toUserInput().username}",
        type: transaction.type,
        username: owner.toUserInput().username,
        owner: owner,
        user: context.read<UserBloc>().state.user??owner,
        users: transaction.members.map((u) => UserTransactionInput(
            status: transaction.status,
            image: u.profileImage,
            username: u.toUserInput().username,
            account: u.account?.accountNumber.toString()??''
        )).toList(),
        obligations: transaction.obligations.map((o) => TransactionPopupInput(
            title: o.title,
            amount: o.amount.toString(),
            date: o.dueDate
        )).toList(),
        onReject: onDecline,
        onCancel: () {
          Navigator.of(context).pop();
          if(initState!=null) Navigator.of(context).pop();
        },
        initialState: initState,
      );

    },
  );
}
