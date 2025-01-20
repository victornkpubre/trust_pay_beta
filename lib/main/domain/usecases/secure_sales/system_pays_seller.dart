import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SystemPaysSeller {
  final RemoteDataSource _remoteDataSource;
  SystemPaysSeller(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation deliveryObligationInput) async {
    if(!validate(input, deliveryObligationInput)) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Transaction
    final deliveryObligation = deliveryObligationInput.copyWith(
        status: ObligationStatus.verified
    );
    final payoutObligation = input.obligations.firstWhere((o)
      => o.title.compareTo(deliveryObligationInput.title)==0 && o.type==ObligationType.payout);

    final List<Obligation> obligations = input.obligations.map((o) {
      if(o.id==deliveryObligation.id) {
        return deliveryObligation;
      }
      else if(o.id==payoutObligation.id) {
        return payoutObligation;
      }
      else {
        return o;
      }
    }).toList();
    final transaction = input.copyWith(
        obligations: obligations
    );

    return makePayout(_remoteDataSource, input, transaction, payoutObligation);
  }
}


bool validate(Transaction transaction, Obligation obligation) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if the obligation is a delivery obligation that is verified
  final valid = obligation.type==ObligationType.delivery
      && obligation.status==ObligationStatus.verified;
  return valid;
}
