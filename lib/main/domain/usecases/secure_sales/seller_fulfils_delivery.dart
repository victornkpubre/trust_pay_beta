import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SellerFulfilsDelivery {
  final RemoteDataSource _remoteDataSource;
  SellerFulfilsDelivery(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation obligationInput) async {
    if(!validate(input, obligationInput)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    final obligation = obligationInput.copyWith(
      status: ObligationStatus.fulfilled
    );
    final List<Obligation> obligations = input.obligations.map((o)
      => o.id==obligation.id? obligation: o).toList();
    final transaction = input.copyWith(
      obligations: obligations
    );

    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final user = transaction.members.firstWhere((u) => u.id == transaction.userId);
    return await sendNotification(
        input,
        response,
        "Seller Fulfilled an Obligation",
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

bool validate(Transaction transaction, Obligation obligation) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if the obligation is a delivery obligation that is pending
  final valid = obligation.type==ObligationType.delivery
      && obligation.status==ObligationStatus.pending;
  return valid;
}
