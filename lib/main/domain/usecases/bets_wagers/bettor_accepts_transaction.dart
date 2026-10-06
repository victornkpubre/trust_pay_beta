import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class BettorAcceptsTransaction {
  final RemoteDataSource _remoteDataSource;
  BettorAcceptsTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input) async {
    final expired = expiredTransactionFailure(input);
    if (expired != null) return Left(expired);
    if(!validate(input)){
      return Left(Failure(300, 'This transaction can no longer be accepted: some obligations are no longer pending.'));
    }

    final transaction = input.copyWith(
        status: TransactionStatus.accepted
    );

    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final owner = transaction.members.firstWhere((u) => u.id == transaction.userId);
    final bettor = transaction.members.firstWhere((u) => u.id != input.mediation?.binding);
    return await sendNotification(
        transaction,
        response,
        "${bettor.toUserInput().username} Accept the Transaction",
        bettor,
        owner,
        _remoteDataSource, () async {
          //Reverse transaction update
          await _remoteDataSource.updateTransaction(input.id??-1, input);
        }
    );
  }
}

bool validate(Transaction transaction) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if every obligation is at the pending state
  bool valid = true;
  for(Obligation obligation in transaction.obligations){
    if(obligation.status != ObligationStatus.pending){
      valid = false;
      break;
    }
  }
  return valid;
}
