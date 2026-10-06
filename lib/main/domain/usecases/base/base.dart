import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';


enum PaymentType {account, bank, card}
enum PaymentMode {payIn, payOut}
enum ResolutionType {refundPayments, authorizePayment}

/// Notifications are a side effect of an action that has already succeeded
/// (the transaction update above returned 200). A failed notification is
/// reported through the callback but never turns the action into a failure
/// or rolls it back — previously a receiver without a push token made the
/// app silently undo the user's accept/payment.
Future<Either<Failure, Transaction>>  sendNotification(Transaction input, TransactionResponse response, String message, User sender, User receiver, RemoteDataSource remoteDataSource, Function requestFailed) async {
  if(response.status !=  200) {
    requestFailed();
    return Left(Failure(response.status??500, response.message?? ''));
  }

  final transaction = response.toDomain();
  await _notify(remoteDataSource, transaction, message, sender, [receiver], (_) {});
  return Right(transaction);
}


Future<Either<Failure, Transaction>> sendNotificationToAllMembers(Transaction input, TransactionResponse response, String message, User sender, RemoteDataSource remoteDataSource, Function(User) notificationFailed) async {
  if(response.status !=  200) {
    return Left(Failure(response.status??500, response.message?? ''));
  }

  final transaction = response.toDomain();
  await _notify(remoteDataSource, transaction, message, sender, input.members, notificationFailed);
  return Right(transaction);
}


Future<Either<Failure, Transaction>> sendNotificationToAllMembersExceptSender(Transaction input, TransactionResponse response, String message, User sender, RemoteDataSource remoteDataSource, Function(User) notificationFailed) async {
  if(response.status !=  200) {
    return Left(Failure(response.status??500, response.message?? ''));
  }

  final transaction = response.toDomain();
  final receivers = input.members.where((member) => member.id != sender.id).toList();
  await _notify(remoteDataSource, transaction, message, sender, receivers, notificationFailed);
  return Right(transaction);
}

/// Sends one notification per receiver, all at once rather than one request
/// after another.
Future<void> _notify(RemoteDataSource remoteDataSource, Transaction transaction, String message, User sender, List<User> receivers, Function(User) notificationFailed) async {
  final notification = Notification(
      message: message,
      user: sender,
      state: NotificationState.sent,
      transaction: transaction,
      date: DateTime.now()
  );

  await Future.wait(receivers.map((receiver) async {
    try {
      final notificationResponse = await remoteDataSource.createNotification(notification, receiver: receiver);
      if (notificationResponse.status != 200) {
        notificationFailed(receiver);
      }
    }
    catch (e) {
      notificationFailed(receiver);
    }
  }));
}


// Releases an already-collected payment to another member of the same
// transaction (e.g. the bill-split owner receiving a contributor's
// payment) — via the authorized escrow-transfer endpoint, never the
// self-only accountDeposit path. A negative payoutObligation.amount rolls
// back a payout that was already credited (see refundUser()'s "reverse
// reversal" case).
Future<UserResponse?> makePayout(RemoteDataSource remoteDataSource, Transaction transaction, Obligation payoutObligation) async {
  return await remoteDataSource.escrowPayout(
      transaction.id??-1,
      payoutObligation.binding??-1,
      payoutObligation.amount,
      transaction.currency,
  );
}


Future<UserResponse?> reversePayment(RemoteDataSource remoteDataSource, PaymentType type, Obligation obligationInput, String currency) async {
  switch (type) {
    case PaymentType.account:
      return await remoteDataSource.payAccount(
          obligationInput.binding??-1,
          obligationInput.amount*-1,
          currency
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

Future<UserResponse?> makePayment(RemoteDataSource remoteDataSource, PaymentType type, Obligation obligationInput, String currency) async {
  switch (type) {
    case PaymentType.account:
      return await remoteDataSource.payAccount(
          obligationInput.binding??-1,
          obligationInput.amount,
          currency
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


Future<Either<Failure, Transaction>> refundUser(remoteDataSource, Transaction input, paymentObligation) async {
  //Make payout to seller, via the authorized escrow-transfer endpoint
  final reversalResponse = await remoteDataSource.escrowPayout(
      input.id??-1, paymentObligation.binding??-1, paymentObligation.amount, input.currency
  );
  if(reversalResponse.status == 200) {
    //Send notification
    final user = input.members.firstWhere((u) => u.id == input.userId);
    final notification = Notification(
        message: "${user.toUserInput().username} Verified an Obligation",
        user: user,
        state: NotificationState.sent,
        transaction: input,
        date: DateTime.now()
    );
    final notificationResponse = await remoteDataSource.createNotification(notification);
    if(notificationResponse.status == 200) {
      //Return result
      return Right(input);
    }
    else {
      //Reverse reversal
      await remoteDataSource.escrowPayout(
          input.id??-1, paymentObligation.binding??-1, paymentObligation.amount*-1, input.currency
      );
      return Left(Failure(notificationResponse.status??500, notificationResponse.message??''));
    }
  }
  else {
    return Left(Failure(reversalResponse.status??500, reversalResponse.message??''));
  }
}