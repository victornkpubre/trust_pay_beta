import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/data_source/data_sources/remote_data_source.dart';
import '../../entities/base/failures.dart';


class MemberCancelsTransaction {
  final RemoteDataSource _remoteDataSource;
  MemberCancelsTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, User user) async {
    if(!validate(input)) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Reverse Payment
    final paidPaymentsObligations = input.obligations.where((o)
      => o.type==ObligationType.payment && o.status==ObligationStatus.paid).toList();
    for(final obligation in paidPaymentsObligations) {
      final reversalResponse = await reversePayment(_remoteDataSource, PaymentType.account, obligation, input.currency);
      if(reversalResponse==null || reversalResponse.status!=200){
        return Left(Failure(300, 'Payment Reversal for ${obligation.title} Failed'));
      }
    }

    //Update Obligations
    final updatedObligations = input.obligations.map((o) {
      if(paidPaymentsObligations.contains(o)){
        return paidPaymentsObligations.firstWhere((item) => o.id==item.id).copyWith(
          status: ObligationStatus.failed
        );
      }
      else {
        return o;
      }
    }).toList();

    //Update Transaction
    input.notes?.add('Transaction cancelled by ${user.toUserInput().username}: ${user.id}');
    final transaction = input.copyWith(
        status: TransactionStatus.declined,
        obligations: updatedObligations
    );
    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    return await sendNotificationToAllMembersExceptSender(
        transaction,
        response,
        "${user.toUserInput().username} Made a Payment",
        user,
        _remoteDataSource,
            (failedNotificationTo) async {
          //Retry sending notification
        }
    );
  }
}

bool validate(Transaction transaction) {
  bool payoutObligationIsPending = transaction.obligations.firstWhere((o) {
    return o.type==ObligationType.payout;
  }).status == ObligationStatus.pending;

  if(!payoutObligationIsPending) {
    return false;
  }

  //check that transaction is at verification or declined stage
  return transaction.status==TransactionStatus.verification || transaction.status==TransactionStatus.declined;
}

