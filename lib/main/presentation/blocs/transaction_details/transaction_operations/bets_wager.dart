import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/bettor_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/bettor_declines_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/bettor_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/mediator_makes_complaint.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/mediator_verifies_assertion.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/member_cancels_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/member_makes_complaint.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/owner_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/owner_extends_expiry_date.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

Future<Either<Failure, Transaction>> acceptTransactionBetsWager(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  return BettorAcceptsTransaction(context.read<RemoteDataSource>())
      .execute(transaction);
}

Future<Either<Failure, Transaction>> declineTransactionBetsWager(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final note = event.note;
  return BettorDeclinesTransaction(context.read<RemoteDataSource>())
      .execute(transaction, note);
}

Future<Either<Failure, Transaction>> paymentTransactionBetsWager(BuildContext context, Emitter emit, PaymentTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;
  final type = event.paymentType;
  final obligation = event.obligation;

  if(user.id == transaction.userId) {
    return OwnerMakesPayment(context.read<RemoteDataSource>())
        .execute(transaction, type);
  }
  else {
    return BettorMakesPayment(context.read<RemoteDataSource>())
        .execute(transaction, obligation, type);
  }
}

Future<Either<Failure, Transaction>> cancelTransactionBetsWager(BuildContext context,  Emitter emit, CancelTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;

  return MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user);
}

Future<Either<Failure, Transaction>> verifyTransactionBetsWager(BuildContext context,  Emitter emit, VerifyTransactionObligation event) async {
  final transaction = event.transaction;
  final user = event.user;

  return MediatorVerifiesAssertion(context.read<RemoteDataSource>()).execute(transaction, user);
}

Future<Either<Failure, Transaction>> complaintTransactionBetsWager(BuildContext context,  Emitter emit, ComplaintTransaction event) async {
  final transaction = event.transaction;
  final note = event.note;
  final user = event.user;

  if(user.id==transaction.mediation?.mediator) {
    return MediatorMakesComplaint(context.read<RemoteDataSource>()).execute(transaction, note);
  }
  else {
    return MemberMakesComplaint(context.read<RemoteDataSource>()).execute(transaction, note, user);
  }
}

Future<Either<Failure, Transaction>> extendTransactionBetsWager(BuildContext context,  Emitter emit, ExtendTransaction event) async {
  final transaction = event.transaction;
  final date = event.date;

  return OwnerExtendsExpiryDate(context.read<RemoteDataSource>())
      .execute(transaction, date);
}