import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/member_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/member_cancels_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/member_declines_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/owner_extends_expiry_date.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import '../../../../domain/usecases/money_pool/owner_makes_payment.dart';

Future<Either<Failure, Transaction>> acceptTransactionMoneyPool(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;
  return MemberAcceptsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user);
}

Future<Either<Failure, Transaction>> declineTransactionMoneyPool(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;
  final note = event.note;

  return MemberDeclinesTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user, note);
}

Future<Either<Failure, Transaction>> paymentTransactionMoneyPool(BuildContext context,  Emitter emit, PaymentTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;
  final type = event.paymentType;
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

Future<Either<Failure, Transaction>> cancelTransactionMoneyPool(BuildContext context,  Emitter emit, CancelTransaction event) async {
  final transaction = event.transaction;
  final user = event.user;
  return MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user);
}

Future<Either<Failure, Transaction>> extendTransactionMoneyPool(BuildContext context,  Emitter emit, ExtendTransaction event) async {
  final transaction = event.transaction;
  final date = event.date;

  return OwnerExtendsExpiryDate(context.read<RemoteDataSource>())
      .execute(transaction, date);
}