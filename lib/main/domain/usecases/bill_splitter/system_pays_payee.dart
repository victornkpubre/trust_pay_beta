import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SystemPaysPayee {
  final RemoteDataSource _remoteDataSource;
  SystemPaysPayee(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input) async {
    if(!validate(input)) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    if(input.payee == null){
      //Set transaction payee
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Transaction
    Obligation payoutObligation = input.obligations.firstWhere((o)
      => o.type==ObligationType.payout).copyWith(
      status: ObligationStatus.paid
    );

    final List<Obligation> obligations = input.obligations.map((o) {
      if(o.id==payoutObligation.id) {
        return payoutObligation;
      }
      else {
        return o;
      }
    }).toList();

    final transaction = input.copyWith(
      status: TransactionStatus.completed,
        obligations: obligations
    );

    return makePayout(_remoteDataSource, input, transaction, payoutObligation);
  }
}

bool validate(Transaction transaction) {

  //check if all payments are paid
  return transaction
      .obligations
      .fold(true, (prev, o) {
        return prev==false?
          false:
          o.type==ObligationType.payment && o.status==ObligationStatus.paid;
      }
  );
}
