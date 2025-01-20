import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SystemRefundsBuyer {
  final RemoteDataSource _remoteDataSource;
  SystemRefundsBuyer(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input) async {
    final obligation = input.obligations.firstWhere((o) => o.type==ObligationType.payment);
    if(!validate(input, obligation)) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }
    return refundUser(_remoteDataSource, input, obligation);
  }
}


bool validate(Transaction transaction, Obligation obligation) {
  //Check that transaction is in declined state
  if(transaction.status==TransactionStatus.declined){
    return false;
  }

  //Check if the buyer has made payment
  return obligation.status==ObligationStatus.paid;
}
