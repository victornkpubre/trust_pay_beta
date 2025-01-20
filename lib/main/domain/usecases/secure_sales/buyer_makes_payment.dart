import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/responses/user/responses.dart';


class BuyerMakesPayment {
  final RemoteDataSource _remoteDataSource;
  BuyerMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation obligationInput, PaymentType type) async {
    //Validation
    if(!validate(input) ) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Make payment via backend gateway
    UserResponse? paymentResponse = await makePayment(_remoteDataSource, type, obligationInput);
    if(paymentResponse == null || paymentResponse.status != 200) {
      return Left(Failure(300, 'Transaction failed'));
    }

    //Modify obligation
    Obligation obligation = obligationInput.copyWith(
        status: ObligationStatus.paid
    );

    if(!input.obligations.contains(obligationInput)) {
      return Left(Failure(300, 'Invalid Input'));
    }

    //Update Obligation List
    List<Obligation> obligations = input.obligations.map((o)
    => o.id == obligationInput.id? obligation: o).toList();

    //Update transaction
    Transaction transaction = input.copyWith(
        obligations: obligations,
        status: TransactionStatus.verification
    );
    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final user = transaction.members.firstWhere((u) => u.id == obligationInput.binding);
    return await sendNotification(
        input,
        response,
        "Buyer's Payment Successful",
        user,
        _remoteDataSource, () async {
          //Reverse transaction update and payment
          await _remoteDataSource.updateTransaction(input.id??-1, input);
          await reversePayment(_remoteDataSource, PaymentType.account, obligationInput);
        }
    );
  }
}

bool validate(Transaction transaction) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if transaction status is accepted or verification
  return transaction.status == TransactionStatus.accepted
      || transaction.status == TransactionStatus.verification;
}
