import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class AdminReversesPayment {
  final RemoteDataSource _remoteDataSource;
  AdminReversesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation paymentObligation) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Reverse payments
    List<Obligation> obligations = [];
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
      else {
        obligations.add(o);
      }
    }

    //Update transaction
    final transaction = input.copyWith(
        status: TransactionStatus.verification,
        obligations: obligations
    );

    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    final user = transaction.members.firstWhere((u) => u.id != transaction.userId);
    return await sendNotification(
        input,
        response,
        "Transaction was reversed by Admin",
        user,
        _remoteDataSource, () async {
          //Reverse transaction update
          await _remoteDataSource.updateTransaction(input.id??-1, input);
        }
    );
  }

  bool validate(Transaction transaction) {
    //check that transaction hasn't expired
    if(transaction.expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    //Check all payments have been paid
    for(Obligation obligation in transaction.obligations){
      if(obligation.type==ObligationType.payment && obligation.status != ObligationStatus.paid){
        return false;
      }
    }

    //Check that payout is failed
    return transaction.obligations.firstWhere((o)
    =>o.type==ObligationType.payout).status == ObligationStatus.failed;
  }



}

