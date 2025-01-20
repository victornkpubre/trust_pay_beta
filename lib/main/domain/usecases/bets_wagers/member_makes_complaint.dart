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

    //Update Obligations
    final obligation = input.obligations.firstWhere((o)
    => o.binding==user.id).copyWith(
      status: ObligationStatus.failed
    );
    final obligations = input.obligations.map((o)
      => o.id==obligation.id? obligation: o).toList();

    final transaction = input.copyWith(
        status: TransactionStatus.declined,
        note: reason,
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
        "${user.toUserInput().username} Made a Complaint",
        user,
        _remoteDataSource, () async {
          //Reverse transaction update and payment
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

  //Check if payout is verified
  bool payoutIsVerified = transaction.obligations.firstWhere((o)
    => o.type==ObligationType.payout).status==ObligationStatus.verified;
  return payoutIsVerified;
}
