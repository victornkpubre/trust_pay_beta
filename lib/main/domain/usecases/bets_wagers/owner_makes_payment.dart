import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import '../../../data/responses/user/responses.dart';


class OwnerMakesPayment {
  final RemoteDataSource _remoteDataSource;
  OwnerMakesPayment(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation obligationInput, PaymentType type) async {
    if(validate(input) ) {
      //Make payment via backend gateway
      UserResponse? paymentRespone = await makePayment(_remoteDataSource, type, obligationInput);
      if(paymentRespone == null || paymentRespone.status != 200) {
        return Left(Failure(300, 'Invalid Transaction State'));
      }

      //Modify transaction
      Obligation obligation = obligationInput.copyWith(
          status: ObligationStatus.paid
      );
      List<Obligation> obligations = input.obligations.map((o)
      => o.id == obligationInput.id? obligation: o).toList();
      Transaction transaction = input.copyWith(
          obligations: obligations,
          status: TransactionStatus.verification
      );

      final response = await _remoteDataSource.updateTransaction(
          transaction.id??-1,
          transaction
      );

      //Send notification
      final user = transaction.members.firstWhere((u) => u.id == obligationInput.binding);
      return await sendNotification(
          input,
          response,
          "${user.toUserInput().username} Accepted the Transaction",
          user,
          _remoteDataSource, () async {
            //Reverse transaction update and payment
            await _remoteDataSource.updateTransaction(
                input.id??-1,
                input
            );
            return Left(Failure(response.status??500, response.message??''));
          }
      );

      if(paymentRespone.status ==  200) {
        //Update transaction
        final transactionResponse = await _remoteDataSource.updateTransaction(transaction.id??-1, transaction);
        if(transactionResponse.status ==  200) {

          //Send notification
          final user = transaction.members.firstWhere((u) => u.id == obligationInput.binding);
          return await sendNotification(
              input,
              transactionResponse,
              "${user.toUserInput().username} Accepted the Transaction",
              user,_remoteDataSource, () async {
            //Reverse transaction update and payment
            await _remoteDataSource.updateTransaction(input.id??-1, input);
            await reversePayment(_remoteDataSource, type, obligationInput);
            return Left(Failure(paymentRespone.status??500, paymentRespone.message??''));
          });
        }
        else {
          //Reverse payment
          await reversePayment(_remoteDataSource, type, obligationInput);
          return Left(Failure(paymentRespone.status??500, paymentRespone.message??''));
        }
      }
      else {
        return Left(Failure(paymentRespone.status??500, paymentRespone.message??''));
      }
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

  //check if all obligations are pending
  bool allTransactionsArePending = transaction
      .obligations
      .fold(true, (value, o) => o.status==ObligationStatus.pending);
  if(!allTransactionsArePending) {
    return false;
  }

  //check if that transaction is accepted
  return transaction.status == TransactionStatus.accepted;
}
