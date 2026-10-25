import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

/// Reloads the wallets (balance and, on the account screen, their history)
/// and the transaction list. Money moves on the server — payments, bill
/// payouts — so call this after a payment or when a notification arrives.
void refreshWalletsAndTransactions(BuildContext context) {
  final userBloc = context.read<UserBloc>();
  final userId = userBloc.state.user?.id ?? context.read<AppPreferences>().getUser()?.id;
  if (userId == null) return;

  userBloc.add(UserEvent.getAccounts(userBloc.state, userId));

  final transactionBloc = context.read<TransactionBloc>();
  transactionBloc.add(TransactionEvent.getUsersHistory(userId, AppConstants.pageSize, 1, transactionBloc.state));
}
