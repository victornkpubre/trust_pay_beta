import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class BettorDeclinesTransaction {
  final RemoteDataSource _remoteDataSource;
  BettorDeclinesTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, String reason) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    input.notes?.add(reason);
    final transaction = input.copyWith(
      status: TransactionStatus.declined,
      notes: input.notes==null?[reason]: [...input.notes!, reason]
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
        "${bettor.toUserInput().username} Declined the Transaction",
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
