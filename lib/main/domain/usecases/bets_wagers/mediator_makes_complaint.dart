import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class MediatorMakesComplaint {
  final RemoteDataSource _remoteDataSource;
  MediatorMakesComplaint(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, String reason) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Update Obligation
    final obligation = input.obligations.firstWhere((o) => o.type==ObligationType.payout);
    final obligations = input.obligations.map((o)
      => o.id==obligation.id? obligation.copyWith(status: ObligationStatus.failed): o
    ).toList();

    //Update Transaction
    final transaction = input.copyWith(
      status: TransactionStatus.declined,
      obligations: obligations,
      note: reason
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
        "${user.toUserInput().username} Created a Complaint",
        user,
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

  //Check if all payments are paid and payout is pending
  for(Obligation obligation in transaction.obligations){
    if(obligation.type == ObligationType.payment && obligation.status != ObligationStatus.paid){
      return false;
    }

    if(obligation.type == ObligationType.payout && obligation.status != ObligationStatus.pending){
      return false;
    }
  }
  return true;
}
