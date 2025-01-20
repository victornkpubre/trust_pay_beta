import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/data_source/data_sources/remote_data_source.dart';
import '../../entities/base/failures.dart';

class MemberCancelsTransaction {
  final RemoteDataSource _remoteDataSource;
  MemberCancelsTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, User user) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }


    //Compute resolution amount
    final debt = computeMoneyPoolDebit(input, user);
    final obligation = input.obligations.firstWhere((o) {
      return o.binding==user.id && o.type==ObligationType.payment;
    });
    if(debt > 0) {
      final user = await makePayment(
          _remoteDataSource,
          PaymentType.account,
          obligation.copyWith(amount: debt)
      );

      if(user!=null){
        return Left(Failure(300, 'Payment failed'));
      }
    }
    else {
      final user = await reversePayment(
          _remoteDataSource,
          PaymentType.account,
          obligation.copyWith(amount: debt*-1)
      );

      if(user!=null){
        return Left(Failure(300, 'Payment failed'));
      }

    }


    //Update Obligation
    final obligations = input.obligations.map((o) {
      if (o.binding == user.id) {
        return o.copyWith(status: ObligationStatus.failed);
      }
      return o;
    }).toList();


    //Update Transaction
    final transaction = input.copyWith(
        status: TransactionStatus.declined,
        obligations: obligations
    );
    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );


    //Send notification
    return await sendNotification(
        input,
        response,
        "${user.toUserInput().username} Withdrew from the Transaction",
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
  //check that the transaction is not at the pending or completed
  if(transaction.status==TransactionStatus.pending || transaction.status==TransactionStatus.completed) {
    return false;
  }
  return true;
}

