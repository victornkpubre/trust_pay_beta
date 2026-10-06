import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class MemberAcceptsTransaction {
  final RemoteDataSource _remoteDataSource;
  MemberAcceptsTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, User user) async {
    final expired = expiredTransactionFailure(input);
    if (expired != null) return Left(expired);
    if(!validate(input)){
      return Left(Failure(300, 'This transaction is no longer pending, so it can no longer be accepted.'));
    }

    //Modify Obligations
    List<Obligation> obligations = input.obligations.map((o)
      => o.type==ObligationType.payment && o.binding == user.id?
        o.copyWith(status: ObligationStatus.verified):
      o
    ).toList();

    //Check if all payments are verified
    bool allPaymentAreVerified = obligations.fold(true, (prev, o) {
      if(prev == false) return false;
      if(o.type==ObligationType.payment && o.status!=ObligationStatus.verified) {
        return false;
      }
      return prev;
    });

    //Update Transaction
    final transaction = input.copyWith(
        status: allPaymentAreVerified? TransactionStatus.accepted: TransactionStatus.pending,
        obligations: obligations
    );
    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    return await sendNotificationToAllMembersExceptSender(
        transaction,
        response,
        "${user.toUserInput().username} Cancelled the Transaction",
        user,
        _remoteDataSource,
        (failedNotificationTo) async {
          //Retry sending notification
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
