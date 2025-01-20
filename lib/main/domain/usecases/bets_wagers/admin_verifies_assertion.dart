import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class AdminVerifiesAssertion {
  final RemoteDataSource _remoteDataSource;
  AdminVerifiesAssertion(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, User user) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify transaction
    Obligation obligation = input.obligations
        .firstWhere((o) => o.type==ObligationType.payout)
        .copyWith(
        status: ObligationStatus.verified,
        binding: user.id
    );
    List<Obligation> obligations = input.obligations.map((o)
    => o.id == obligation.id? obligation: o).toList();

    final transaction = input.copyWith(
        status: TransactionStatus.verification,
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
        "Transaction was verified by Admin",
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

  //Check all payments have been paid
  for(Obligation obligation in transaction.obligations){
    if(obligation.type==ObligationType.payment && obligation.status != ObligationStatus.paid){
      return false;
    }
  }

  //Check that payout is failed
  return transaction.obligations.firstWhere((o)
      =>o.type==ObligationType.payout).status == ObligationStatus.failed;
}
