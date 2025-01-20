import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SystemMakesPayment {
  final RemoteDataSource _remoteDataSource;
  SystemMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input) async {
    if(!validate(input)) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Transaction
    Obligation payoutObligation = input.obligations.firstWhere((o)
    => o.type==ObligationType.payout).copyWith(
        status: ObligationStatus.paid
    );

    if(payoutObligation.binding == null){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

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
  for(final o in transaction.obligations) {
    if(o.type==ObligationType.payment && o.status!=ObligationStatus.paid) {
      return false;
    }
  }

  //Check if payout is verified
  return transaction.obligations.firstWhere((o)
    => o.type==ObligationType.payout).status==ObligationStatus.verified;
}
