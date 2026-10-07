import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/popups/flows/transaction_acceptance_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';


void showAcceptTransactionModal(context, Transaction transaction, User owner, Function onAccept) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return TransactionAcceptancePopup(
        width: MediaQuery.of(context).size.width,
        amount: transaction.total,
        transactionTitle: transaction.title,
        expiryDate: transaction.expiryDate,
        currency: transaction.currency,
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
        onAccept: onAccept,
        onCancel: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}