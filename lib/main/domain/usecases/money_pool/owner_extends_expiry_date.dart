import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class OwnerExtendsExpiryDate {
  final RemoteDataSource _remoteDataSource;
  OwnerExtendsExpiryDate(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, DateTime date) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify obligations due dates
    List<Obligation> obligations = input.obligations.map((o) {
      if(o.status == ObligationStatus.pending){
        if(o.dueDate.isBefore(date)){
          return o.copyWith(
              dueDate: date
          );
        }
      }
      return o;
    }).toList();

    //Modify transaction due date
    final transaction = input.copyWith(
        expiryDate: date,
        obligations: obligations
    );

    //Update Transaction
    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final user = transaction.members.firstWhere((u) => u.id == transaction.userId);
    return await sendNotification(
        input,
        response,
        "Transaction has Expired",
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
  //check that transaction has expired
  if(!transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check that transaction is at verification state
  return transaction.status==TransactionStatus.verification;
}
