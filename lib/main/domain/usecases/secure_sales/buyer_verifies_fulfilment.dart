import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class BuyerVerifiesFulfilment {
  final RemoteDataSource _remoteDataSource;
  BuyerVerifiesFulfilment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation obligationInput) async {
    if(!validate(input, obligationInput)) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Transaction
    final obligation = obligationInput.copyWith(
      status: ObligationStatus.paid
    );
    final List<Obligation> obligations = input.obligations.map((o) => o.id==obligation.id? obligation: o).toList();
    //Check if all delivery has been fulfilled
    final allDeliveryFulfilled = obligations.where((o) => o.type==ObligationType.delivery).fold(true, (prev, value) {
      if(prev==false) return false;
      if(value.status==ObligationStatus.paid) return true;
      return false;
    });
    final transaction = input.copyWith(
      obligations: obligations,
      status: allDeliveryFulfilled? TransactionStatus.completed: input.status
    );

    //Update Transaction
    final response = await _remoteDataSource.updateTransaction(
      transaction.id??-1,
      transaction
    );

    //Make payout for fulfilment
    UserResponse? paymentResponse = await makePayout(_remoteDataSource, transaction, obligationInput);
    if(paymentResponse == null || paymentResponse.status != 200) {
      //Reverse transaction update
      await _remoteDataSource.updateTransaction(input.id??-1, input);
      return Left(Failure(300, 'Transaction failed'));
    }

    //Send notification
    final buyer = transaction.members.firstWhere((u) => u.id == input.userId);
    final seller = transaction.members.firstWhere((u) => u.id != input.userId);
    return await sendNotification(
      transaction,
      response,
      "${buyer.toUserInput().username} Verified A Fulfillment",
      buyer,
      seller,
      _remoteDataSource, () async {
        //Reverse transaction update and payment
        await _remoteDataSource.updateTransaction(input.id??-1, input);
        await reversePayment(_remoteDataSource, PaymentType.account, obligationInput, input.currency);
      }
    );
  }
}

bool validate(Transaction transaction, Obligation obligation) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if the obligation is a delivery obligation that is fulfilled
  final valid = obligation.type==ObligationType.delivery
      && obligation.status==ObligationStatus.fulfilled;
  return valid;
}
