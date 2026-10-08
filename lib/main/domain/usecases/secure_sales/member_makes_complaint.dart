import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class MemberMakesComplaint {
  final RemoteDataSource _remoteDataSource;
  MemberMakesComplaint(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, String reason, User user) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    input.notes?.add(reason);
    final transaction = input.copyWith(
        status: TransactionStatus.declined
    );
    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final userCancelling = user;
    final receiver = transaction.members.firstWhere((u) => u.id != user.id);
    return await sendNotification(
        transaction,
        response,
        "${user.toUserInput().username} Made a Complaint",
        userCancelling,
        receiver,
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
  //check that transaction is in verification status
  if(transaction.status!=TransactionStatus.verification) {
    return false;
  }

  //Check if any delivery has been fulfilled
  return transaction.obligations.fold(false, (prev, o) {
    if(prev){
      return true;
    }
    if(o.type.isFulfilment && o.status==ObligationStatus.fulfilled){
      return true;
    }
    return prev;
  });
}
