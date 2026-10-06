import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class MediatorVerifiesAssertion {
  final RemoteDataSource _remoteDataSource;
  MediatorVerifiesAssertion(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, User user) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Transaction
    final winningObligation = input.obligations.firstWhere((o) => o.type==ObligationType.payout && o.binding==user.id);
    final losingObligation = input.obligations.firstWhere((o) => o.type==ObligationType.payout && o.binding!=user.id);
    Obligation winningObligationModified = winningObligation.copyWith(
      status: ObligationStatus.paid,
      amount: winningObligation.amount*2
    );
    Obligation losingObligationModified = losingObligation.copyWith(
      status: ObligationStatus.paid,
      amount: losingObligation.amount*0
    );

    List<Obligation> obligations = input.obligations.map((o) {
      if(o.id == winningObligationModified.id) return winningObligationModified;
      if(o.id == losingObligationModified.id) return losingObligationModified;
      return o;
    }).toList();

    //Make payment to winner
    UserResponse? winningPaymentResponse = await makePayout(_remoteDataSource, input, winningObligationModified);
    UserResponse? losingPaymentResponse = await makePayout(_remoteDataSource, input, losingObligationModified);
    if(winningPaymentResponse == null || winningPaymentResponse.status != 200 || losingPaymentResponse == null || losingPaymentResponse.status != 200) {
      return Left(Failure(300, 'Payout failed'));
    }

    final transaction = input.copyWith(
      status: TransactionStatus.completed,
      obligations: obligations
    );

    final response = await _remoteDataSource.updateTransaction(
      transaction.id??-1,
      transaction
    );

    //Send notification
    final mediator = transaction.members.firstWhere((u) => u.id != transaction.mediation?.mediator);
    return await sendNotificationToAllMembersExceptSender(
        transaction,
        response,
        "${mediator.toUserInput().username} Modified the Transaction",
        mediator,
        _remoteDataSource,
            (failedNotificationTo) async {
          //Reverse transaction update and payment
          await _remoteDataSource.updateTransaction(
              input.id??-1,
              input
          );
        }
    );
  }
}

bool validate(Transaction transaction) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check that every payment has been made
  bool valid = true;
  final obligations = transaction.obligations.where((o) => o.type==ObligationType.payment).toList();
  for(final obligation in obligations) {
    if(obligation.status != ObligationStatus.paid) {
      return false;
    }
  }
  return valid;
}
