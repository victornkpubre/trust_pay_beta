import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';


/// A member pays their share of a bill split. Everything with money happens
/// on the server in one database transaction (POST obligations/{id}/pay):
/// the wallet is debited, the share recorded as held, and — once every share
/// has really been collected — the payee is paid the collected total and the
/// split is completed. The app no longer pays the payee itself, so a failure
/// can't take a member's money without recording it.
class MemberMakesPayment {
  final RemoteDataSource _remoteDataSource;
  MemberMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation obligationInput, PaymentType type) async {
    final expired = expiredTransactionFailure(input);
    if (expired != null) return Left(expired);
    if(!validate(input)) {
      return Left(Failure(300, 'The organiser has to pay their share first.'));
    }

    try {
      final response = await _remoteDataSource.payObligation(obligationInput.id ?? -1);

      //Send notification
      final member = input.members.firstWhere((u) => u.id == obligationInput.binding);
      return await sendNotificationToAllMembersExceptSender(
          input,
          response,
          "${member.toUserInput().username} Made a Payment",
          member,
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

  //check if that transaction at verification stage
  return transaction.status == TransactionStatus.verification;
}
