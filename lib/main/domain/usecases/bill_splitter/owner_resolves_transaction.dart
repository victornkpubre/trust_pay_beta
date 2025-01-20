import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/admin_reverses_payment.dart';
import '../../../data/data_source/data_sources/remote_data_source.dart';
import '../../entities/base/failures.dart';

class OwnerResolvesTransaction {
  final RemoteDataSource _remoteDataSource;
  OwnerResolvesTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, ResolutionType type) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Modify Obligations
    List<Obligation> obligations = [];
    List<User> remainingMembers = [];

    if(type==ResolutionType.refundPayments){
      //Reverse Payments
      for(final o in input.obligations) {
        if(o.type==ObligationType.payment && o.status==ObligationStatus.paid){
          final reversalResponse = await reversePayment(_remoteDataSource, PaymentType.account, o);
          if(reversalResponse==null || reversalResponse.status!=200){
            obligations.add(o);
          }
          else {
            obligations.add(o.copyWith(status: ObligationStatus.failed));
          }
        }
      }
    }
    else {
      //Distribute outstanding payment evenly among members
      List<int> userIdsWithFailedPayments = [];
      final additionalPayment = input.obligations.fold(0.0, (prev, o) {
        if(o.type==ObligationType.payment && o.status==ObligationStatus.failed) {
          userIdsWithFailedPayments.add(o.binding??-1);
          return prev+o.amount;
        }
        return prev;
      });
      remainingMembers = input.members.where((u) => !userIdsWithFailedPayments.contains(u.id)).toList();
      final additionalPaymentPerMember  = additionalPayment / remainingMembers.length;

      for(final o in input.obligations) {
        if(o.status!=ObligationStatus.failed){
          if(o.type==ObligationType.payment && o.status==ObligationStatus.paid) {
            obligations.add(o);
            obligations.add(o.copyWith(
              status: ObligationStatus.verified,
              amount: additionalPaymentPerMember
            ));
          }

          if(o.status==ObligationStatus.verified){
            obligations.add(o.copyWith(
              amount: o.amount+additionalPaymentPerMember
            ));
          }
        }
      }
    }

    //Update Transaction
    final transaction = input.copyWith(
      status: type==ResolutionType.refundPayments? TransactionStatus.declined:  TransactionStatus.verification,
      obligations: obligations,
      members: remainingMembers
    );

    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final user = transaction.members.firstWhere((u) => u.id == transaction.userId);
    return await sendNotification(
        input,
        response,
        type==ResolutionType.refundPayments?
        "${user.toUserInput().username} Cancelled the Transaction":
        "${user.toUserInput().username} Modified the Transaction",
        user,
        _remoteDataSource, () async {
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
  //check that transaction is declined
  if(transaction.status!=TransactionStatus.declined) {
    return false;
  }

  //check that at least one payment has failed
  return transaction.obligations.fold(false, (prev, o){
    if(o.type==ObligationType.payment && o.status==ObligationStatus.failed) {
      return true;
    }
    return prev;
  });
}

