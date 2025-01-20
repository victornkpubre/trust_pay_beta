import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SellerAcceptTransaction {
  final RemoteDataSource _remoteDataSource;
  SellerAcceptTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    final transaction = input.copyWith(
        status: TransactionStatus.accepted
    );

    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final user = transaction.members.firstWhere((u) => u.id != transaction.userId);
    return await sendNotification(
        input,
        response,
        "${user.toUserInput().username} Accepted the Transaction",
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
