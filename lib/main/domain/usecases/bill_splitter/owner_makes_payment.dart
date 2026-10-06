import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/responses/user/responses.dart';


class OwnerMakesPayment {
  final RemoteDataSource _remoteDataSource;
  OwnerMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, PaymentType type) async {
    final expired = expiredTransactionFailure(input);
    if (expired != null) return Left(expired);
    if(validate(input) ) {
      final obligationInput = input.obligations.firstWhere((o)
        => o.binding == input.userId && o.type==ObligationType.payment);
      //Make payment via backend gateway
      UserResponse? paymentResponse = await makePayment(_remoteDataSource, type, obligationInput, input.currency);
      if(paymentResponse == null || paymentResponse.status != 200) {
        return Left(paymentFailure(paymentResponse));
      }

      //Modify transaction
      Obligation obligation = obligationInput.copyWith(
          status: ObligationStatus.paid
      );
      List<Obligation> obligations = input.obligations.map((o)
      => o.id == obligationInput.id? obligation: o).toList();
      final transaction = input.copyWith(
          obligations: obligations,
          status: TransactionStatus.verification
      );

      final response = await _remoteDataSource.updateTransaction(
          transaction.id??-1,
          transaction
      );

      //Send notification
      final owner = transaction.members.firstWhere((u) => u.id == obligationInput.binding);
      return await sendNotificationToAllMembersExceptSender(
          transaction,
          response,
          "${owner.toUserInput().username} Made a Payment",
          owner,
          _remoteDataSource,
              (failedNotificationTo) async {
            //Retry sending notification
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

  //check if that transaction is accepted
  return transaction.status == TransactionStatus.accepted;
}
