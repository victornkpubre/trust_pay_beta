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
  //check that transaction is at verification state
  if(transaction.status!=TransactionStatus.verification) {
    return false;
  }

  //check that at least one payment has been paid
  return transaction.obligations.fold(false, (prev, o){
    if(o.type==ObligationType.payment && o.status==ObligationStatus.paid) {
      return true;
    }
    return prev;
  });
}

