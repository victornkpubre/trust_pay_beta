import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/responses/user/responses.dart';


class MemberMakesPayment {
  final RemoteDataSource _remoteDataSource;
  MemberMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation obligationInput, PaymentType type) async {
    if(validate(input) ) {
      //Make payment via backend gateway
      UserResponse? paymentResponse = await makePayment(_remoteDataSource, type, obligationInput);
      if(paymentResponse == null || paymentResponse.status != 200) {
        return Left(Failure(300, 'Payment Failed'));
      }

      //Modify transaction
      Obligation obligation = obligationInput.copyWith(
          status: ObligationStatus.paid
      );
      List<Obligation> obligations = input.obligations.map((o)
      => o.id == obligationInput.id? obligation: o).toList();
      final transaction = input.copyWith(
          obligations: obligations,
      );


      //Update Transaction
      final response = await _remoteDataSource.updateTransaction(
          transaction.id??-1,
          transaction
      );

      //Send notification
      final user = transaction.members.firstWhere((u) => u.id == input.userId);
      return await sendNotification(
          input,
          response,
          "${user.toUserInput().username} Made a Payment",
          user,
          _remoteDataSource, () async {
            //Reverse transaction update and payment
            await reversePayment(_remoteDataSource, type, obligationInput);
            await _remoteDataSource.updateTransaction(
                input.id??-1,
                input
            );
          }
      );
    }
    else {
      return Left(Failure(300, 'Invalid Transaction State'));
    }
  }
}



bool validate(Transaction transaction) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //check if that transaction at verification stage
  return transaction.status == TransactionStatus.verification;
}
