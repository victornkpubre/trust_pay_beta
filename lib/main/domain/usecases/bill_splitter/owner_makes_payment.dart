import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';


/// The organiser pays their own share of a bill split. The server debits
/// the wallet, records the share and opens the split for the other members
/// in one step (POST obligations/{id}/pay) — see MemberMakesPayment.
class OwnerMakesPayment {
  final RemoteDataSource _remoteDataSource;
  OwnerMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, PaymentType type) async {
    final expired = expiredTransactionFailure(input);
    if (expired != null) return Left(expired);
    if(!validate(input)) {
      return Left(Failure(300, 'This bill split must be accepted before you can pay.'));
    }

    final obligationInput = input.obligations.firstWhere((o)
      => o.binding == input.userId && o.type==ObligationType.payment);

    try {
      final response = await _remoteDataSource.payObligation(obligationInput.id ?? -1);

      //Send notification
      final owner = input.members.firstWhere((u) => u.id == obligationInput.binding);
      return await sendNotificationToAllMembersExceptSender(
          input,
          response,
          "${owner.toUserInput().username} Made a Payment",
          owner,
          _remoteDataSource,
          (failedNotificationTo) async {
            //Retry sending notification
          }
      );
    } catch (e) {
      return Left(Failure.fromError(e));
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
