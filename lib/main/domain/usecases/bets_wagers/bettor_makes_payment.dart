import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/responses/user/responses.dart';


class BettorMakesPayment {
  final RemoteDataSource _remoteDataSource;
  BettorMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation obligationInput, PaymentType type) async {
    final expired = expiredTransactionFailure(input);
    if (expired != null) return Left(expired);
    if(validate(input) ) {
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

      //Check if all payments have been made
      final allPaymentsHaveBeenMade = obligations.where((o) => o.type==ObligationType.payment).fold(true, (prev, value) {
        if(prev==false) return false;
        return value.status==ObligationStatus.paid;
      });

      final transaction = input.copyWith(
          obligations: obligations,
          status: allPaymentsHaveBeenMade? TransactionStatus.verification: input.status
      );

      final response = await _remoteDataSource.updateTransaction(transaction.id??-1, transaction);

      //Send notification
      final member = transaction.members.firstWhere((u) => u.id == obligationInput.binding);
      return await sendNotificationToAllMembersExceptSender(
          transaction,
          response,
          "${member.toUserInput().username} Made a Payment",
          member,
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
