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
    //Photo/video proof with a GPS location is mandatory for secure-sales
    //deliveries (only suggested for attendance)
    if(obligationInput.type==ObligationType.delivery && input.proofsFor(obligationInput.id).isEmpty) {
      return Left(Failure(300, 'Add a photo or video proof of "${obligationInput.title}" before marking it as fulfilled'));
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
    final seller = transaction.members.firstWhere((u) => u.id==obligationInput.binding);
    final buyer = transaction.members.firstWhere((u) => u.id==transaction.userId);
    return await sendNotification(
      transaction,
      response,
      "${seller.toUserInput().username} Fulfilled an Obligation",
      seller,
      buyer,
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

  //Check if the obligation is a delivery/attendance obligation that is pending or fulfilled
  final valid = obligation.type.isFulfilment
      && (obligation.status==ObligationStatus.pending
      || obligation.status==ObligationStatus.fulfilled);
  return valid;
}
