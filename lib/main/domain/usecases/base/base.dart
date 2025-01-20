import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';


enum PaymentType {account, bank, card}
enum ResolutionType {refundPayments, authorizePayment}

Future<Either<Failure, Transaction>>  sendNotification(Transaction input, TransactionResponse response, String message, User user, RemoteDataSource remoteDataSource, Function requestFailed, {User? receiver}) async {
  if(response.status ==  200) {
    final transaction = response.toDomain();

    //Send notification
    final notification = Notification(
        message: message,
        user: user,
        state: NotificationState.sent,
        transaction: transaction
    );

    final notificationResponse = await remoteDataSource.createNotification(notification, receiver: receiver);
    if(notificationResponse.status == 200) {
      //Return result
      return Right(transaction);
    }
    else {
      requestFailed();
      return Left(Failure(response.status??500, response.message??''));
    }
  }
  else {
    return Left(Failure(response.status??500, response.message??''));
  }
}


Future<Either<Failure, Transaction>> makePayout(remoteDataSource, Transaction input, Transaction transaction, Obligation payoutObligation ) async {
  //Make payout to seller
  final payoutResponse = await remoteDataSource.deposit(payoutObligation.binding??-1, payoutObligation.amount);
  if(payoutResponse.status == 200) {
    //Update Transaction
    final response = await remoteDataSource.updateTransaction(
        transaction.id??-1,
        transaction
    );
    if(response.status ==  200) {
      //Send notification
      final user = transaction.members.firstWhere((u) => u.id == payoutObligation.binding);
      final notification = Notification(
          message: "${user.toUserInput().username} Made a Payment",
          user: user,
          state: NotificationState.sent,
          transaction: transaction
      );
      final notificationResponse = await remoteDataSource.createNotification(notification);
      if(notificationResponse.status == 200) {
        //Return result
        return Right(transaction);
      }
      else {
        //Reverse payout and transaction update
        await remoteDataSource.deposit(payoutObligation.binding??-1, payoutObligation.amount*-1);
        await remoteDataSource.updateTransaction(
            input.id??-1,
            input
        );
        return Left(Failure(response.status??500, response.message??''));
      }
    }
    else {
      return Left(Failure(response.status??500, response.message??''));
    }
  }
  else {
    //Reverse payout
    await remoteDataSource.deposit(payoutObligation.binding??-1, payoutObligation.amount*-1);
    return Left(Failure(payoutResponse.status??500, payoutResponse.message??''));
  }
}



Future<UserResponse?> reversePayment(RemoteDataSource remoteDataSource, PaymentType type, Obligation obligationInput) async {
  switch (type) {
    case PaymentType.account:
      return await remoteDataSource.payAccount(
          obligationInput.binding??-1,
          obligationInput.amount*-1
      );
    case PaymentType.bank:
      return await remoteDataSource.payBank(
          obligationInput.binding??-1,
          obligationInput.amount*-1
      );
    case PaymentType.card:
      return await remoteDataSource.payBank(
          obligationInput.binding??-1,
          obligationInput.amount*-1
      );
    default:
      return null;
  }
}

Future<UserResponse?> makePayment(RemoteDataSource remoteDataSource, PaymentType type, Obligation obligationInput) async {
  switch (type) {
    case PaymentType.account:
      return await remoteDataSource.payAccount(
          obligationInput.binding??-1,
          obligationInput.amount
      );
    case PaymentType.bank:
      return await remoteDataSource.payBank(
          obligationInput.binding??-1,
          obligationInput.amount
      );
    case PaymentType.card:
      return await remoteDataSource.payBank(
          obligationInput.binding??-1,
          obligationInput.amount
      );
    default:
      return null;
  }
}

double computeMoneyPoolDebit(Transaction input, User user){
  final totalPayoutsPaid = input.obligations.fold(0.0, (prev, o) {
    if(o.binding==user.id){
      if(o.type==ObligationType.payout && o.status==ObligationStatus.paid) {
        return prev + o.amount;
      }
    }
    return prev;
  });

  final totalPaymentsPaid = input.obligations.fold(0.0, (prev, o) {
    if(o.binding==user.id){
      if(o.type==ObligationType.payment && o.status==ObligationStatus.paid) {
        return prev + o.amount;
      }
    }
    return prev;
  });

  return totalPayoutsPaid - totalPaymentsPaid;
}


Future<Either<Failure, Transaction>> refundUser(remoteDataSource, input, paymentObligation) async {
  //Make payout to seller
  final reversalResponse = await remoteDataSource.deposit(paymentObligation.binding??-1, paymentObligation.amount);
  if(reversalResponse.status == 200) {
    //Send notification
    final user = input.members.firstWhere((u) => u.id == input.userId);
    final notification = Notification(
        message: "${user.toUserInput().username} Verified an Obligation",
        user: user,
        state: NotificationState.sent,
        transaction: input
    );
    final notificationResponse = await remoteDataSource.createNotification(notification);
    if(notificationResponse.status == 200) {
      //Return result
      return Right(input);
    }
    else {
      //Reverse reversal
      await remoteDataSource.deposit(paymentObligation.binding??-1, paymentObligation.amount*-1);
      return Left(Failure(notificationResponse.status??500, notificationResponse.message??''));
    }
  }
  else {
    return Left(Failure(reversalResponse.status??500, reversalResponse.message??''));
  }
}