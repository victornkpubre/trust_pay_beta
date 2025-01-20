import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SystemMakePayment {
  final RemoteDataSource _remoteDataSource;
  SystemMakePayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation payoutObligation) async {
    if(!validate(input, payoutObligation)) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Transaction
    final List<Obligation> obligations = input.obligations.map((o) {
      if(o.id==payoutObligation.id) {
        return payoutObligation.copyWith(status: ObligationStatus.paid);
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

bool validate(Transaction transaction, Obligation obligation) {
  //check that transaction is in verification stage
  if(transaction.status!=TransactionStatus.verification){
    return false;
  }

  //check if all payments related to the payout are paid
  final obligations = transaction.obligations.where((o) {
    return o.dueDate.compareTo(obligation.dueDate)==0;
  });

  return obligations.fold(true, (prev, o) {
    if(prev==false){
      return false;
    }

    if(o.status!=ObligationStatus.paid){
      return false;
    }

    return prev;
  });
}
