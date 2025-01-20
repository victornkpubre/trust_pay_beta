import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class BuyerExtendsExpiryDate {
  final RemoteDataSource _remoteDataSource;
  BuyerExtendsExpiryDate(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, DateTime date) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Update obligations due dates
    List<Obligation> obligations = input.obligations.map((o) {
      if(o.status == ObligationStatus.pending && o.dueDate.isBefore(date)){
        return o.copyWith(
            dueDate: date
        );
      }

      return o;
    }).toList();

    //Update transaction due date
    final transaction = input.copyWith(
        expiryDate: date,
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
        "Buyer's Payment Successful",
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

  //Check if buyer is yet to complete all fulfilments
  bool allFulfilmentsAreVerified = true;
  for(var o in transaction.obligations) {
    if(o.type == ObligationType.delivery){
      if(o.status != ObligationStatus.verified){
        return false;
      }
    }
  }
  return allFulfilmentsAreVerified;
}