import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_cancels_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_declines_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/owner_makes_payment.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

Future<Either<Failure, Transaction>> acceptTransactionBillSplitter(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  final obligation = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment&&o.binding==event.user.id);
  return MemberAcceptsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, obligation);
}

Future<Either<Failure, Transaction>> declineTransactionBillSplitter(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final note = event.note;
  final obligation = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment&&o.binding==event.user.id);
  return MemberDeclinesTransaction(context.read<RemoteDataSource>())
      .execute(transaction, note, obligation);
}

Future<Either<Failure, Transaction>> paymentTransactionBillSplitter(BuildContext context,  Emitter emit, PaymentTransaction event) async {
  final transaction = event.transaction;
  final type = event.paymentType;
  final user = event.user;
  final obligation = event.obligation;

  if(user.id == transaction.userId) {
    return OwnerMakesPayment(context.read<RemoteDataSource>())
        .execute(transaction, type);
  }
  else {
    return MemberMakesPayment(context.read<RemoteDataSource>())
        .execute(transaction, obligation, type);
  }

}

Future<Either<Failure, Transaction>> cancelTransactionBillSplitter(BuildContext context, Emitter emit, CancelTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;
  return MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user);
}

Future<Either<Failure, Transaction>> extendTransactionBillSplitter(BuildContext context,  Emitter emit, ExtendTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;
  return MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user);
}
