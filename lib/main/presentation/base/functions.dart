import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';

import '../../domain/entities/entities.dart';

void initialNotification(BuildContext context, Transaction transaction, TransactionBlocState state) {
  final owner = transaction.members.firstWhere((u) => u.id==transaction.userId);
  context.read<TransactionBloc>().add(TransactionEvent.initialNotification(transaction, owner, "Transaction Request", state));
}

String convertTypeFormBackend(TransactionType type) {

  switch (type) {
    case TransactionType.secureSales:
      return 'secure_sales';
    case TransactionType.billSplitter:
      return 'bill_splitter';
    case TransactionType.betsWagers:
      return 'bets_wagers';
    case TransactionType.moneyPool:
      return 'money_pool';
    case TransactionType.groupGoals:
      return 'group_goals';
    case TransactionType.secureSales:
      return 'secure_sales';
    default :
      return 'secure_sales';
  }

}
String convertStatusFormBackend(TransactionStatus status) {

  switch (status) {
    case TransactionStatus.pending:
      return 'pending';
    case TransactionStatus.accepted:
      return 'accepted';
    case TransactionStatus.declined:
      return 'declined';
    case TransactionStatus.verification:
      return 'verification';
    case TransactionStatus.completed:
      return 'completed';
    default :
      return 'completed';
  }

}