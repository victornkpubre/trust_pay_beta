import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class MemberDeclinesTransaction {
  final RemoteDataSource _remoteDataSource;
  MemberDeclinesTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, String reason, Obligation paymentObligation) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Obligations
    Obligation obligation = paymentObligation.copyWith(
        status: ObligationStatus.failed
    );
    List<Obligation> obligations = input.obligations.map((o)
    => o.id == paymentObligation.id? obligation: o).toList();

    final transaction = input.copyWith(
        obligations: obligations
    );

    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final user = transaction.members.firstWhere((u) => u.id == input.userId);
    return await sendNotification(
        input,
        response,
        "${user.toUserInput().username} Declined the Transaction",
        user,
        _remoteDataSource, () async {
          //Reverse transaction update and payment
          await _remoteDataSource.updateTransaction(
              input.id??-1,
              input
          );
        }
    );
  }
}

bool validate(Transaction transaction) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if transaction is pending
  return transaction.status == TransactionStatus.pending;
}
