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
      UserResponse? paymentResponse = await makePayment(_remoteDataSource, type, obligationInput, input.currency);
      if(paymentResponse == null || paymentResponse.status != 200) {
        return Left(Failure(300, 'Payment Failed'));
      }

      //Modify transaction
      Obligation obligation = obligationInput.copyWith(
          status: ObligationStatus.paid
      );
      List<Obligation> obligations = input.obligations.map((o)
      => o.id == obligationInput.id? obligation: o).toList();

      final user = input.members.firstWhere((u) => u.id == obligationInput.binding);
      final currentUserPayments = obligations.where((o) => o.type==ObligationType.payment && o.binding==user.id).toList();
      final cycleDurationInDays = currentUserPayments[1].dueDate.difference(currentUserPayments[0].dueDate).inDays;
      //Check if all payments for the cycle have been made
      final currentCycleObligations = obligations.where((o) {
        if(o.dueDate.isAfter(DateTime.now())) return false;
        final daysUntilObligationDueDate = o.dueDate.difference(DateTime.now()).inDays;
        return (daysUntilObligationDueDate < cycleDurationInDays);
      });

      final allPaymentForTheCycleHaveBeenPaid = currentCycleObligations
          .where((o) => o.type==ObligationType.payment).fold(true, (prev, o) {
        if(prev==false) return false;
        return o.status==ObligationStatus.paid;
      });

      //Make payment to harvester of the month
      if (allPaymentForTheCycleHaveBeenPaid) {
        //Get payout obligation for the cycle
        final payoutObligation = currentCycleObligations.firstWhere(
           (o) => o.type==ObligationType.payout
        );
        final payoutResponse = await makePayout(_remoteDataSource, input, payoutObligation);
        if(payoutResponse?.status!=200) {
          await reversePayment(_remoteDataSource, type, obligationInput, input.currency);
          Left(Failure(300, 'Invalid Transaction State'));
        }

        obligations = obligations.map((o)
          => o.id == payoutObligation.id? o.copyWith(status: ObligationStatus.paid): o
        ).toList();
      }

      //Check if all payments and payouts have been made
      final allPaymentAndPayoutsHaveBeenPaid = obligations.fold(true, (prev, value) {
        if(prev==false) return false;
        if(value.status==ObligationStatus.paid) return true;
        return false;
      });

      final transaction = input.copyWith(
        obligations: obligations,
        status: allPaymentAndPayoutsHaveBeenPaid? TransactionStatus.completed: input.status
      );

      //Update Transaction
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
          (failedNotificationTo) async {}
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
  return true;
}
