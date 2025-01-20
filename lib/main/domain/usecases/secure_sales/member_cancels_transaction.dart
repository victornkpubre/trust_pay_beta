import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/data_source/data_sources/remote_data_source.dart';
import '../../entities/base/failures.dart';

class MemberCancelsTransaction {
  final RemoteDataSource _remoteDataSource;
  MemberCancelsTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, User user, String reason) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    //Reverse Payment
    final obligation = input.obligations.firstWhere((o)
      => o.type==ObligationType.payment && o.status==ObligationStatus.paid);

    final reversalResponse = await reversePayment(_remoteDataSource, PaymentType.account, obligation);
    if(reversalResponse==null || reversalResponse.status!=200) {
      return Left(Failure(300, 'Payment Reversal Failed'));
    }

    //Update Transaction
    final transaction = input.copyWith(
        status: TransactionStatus.declined,
        note: reason
    );

    final response = await _remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );

    //Send notification
    return await sendNotification(
        input,
        response,
        "${user.toUserInput().username} Cancelled the Transaction",
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
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if seller is yet to fulfil an obligation
  bool noObligationHasBeenFulfilled = true;
  for(var o in transaction.obligations) {
    if(o.type == ObligationType.delivery  && o.status == ObligationStatus.fulfilled) {
      return false;
    }
  }
  return noObligationHasBeenFulfilled;
}