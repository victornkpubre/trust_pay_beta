import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/buyer_extends_expiry_date.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/buyer_verifies_fulfilment.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/member_cancels_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/buyer_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/member_makes_complaint.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/seller_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/seller_declines_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/seller_fulfils_delivery.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

Future<Either<Failure, Transaction>> acceptTransactionSecureSales(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  return SellerAcceptTransaction(context.read<RemoteDataSource>())
      .execute(transaction, event.user);
}

Future<Either<Failure, Transaction>> declineTransactionSecureSales(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final note = event.note;
  return SellerDeclinesTransaction(context.read<RemoteDataSource>())
      .execute(transaction, event.user, note);
}

Future<Either<Failure, Transaction>> paymentTransactionSecureSales(BuildContext context,  Emitter emit, PaymentTransaction event) async {
  final transaction = event.transaction;
  final type = event.paymentType;
  final obligation = event.obligation;

  return BuyerMakesPayment(context.read<RemoteDataSource>())
      .execute(transaction, obligation, type);
}

Future<Either<Failure, Transaction>> cancelTransactionSecureSales(BuildContext context,  Emitter emit, CancelTransaction event) async {
  final transaction = event.transaction;
  final note = event.note;
  final user = event.user;
  return MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user, note);
}

Future<Either<Failure, Transaction>> verifyTransactionSecureSales(BuildContext context,  Emitter emit, VerifyTransactionObligation event) async {
  final transaction = event.transaction;
  final obligation = event.obligation;
  return BuyerVerifiesFulfilment(context.read<RemoteDataSource>())
      .execute(transaction, obligation);
}

Future<Either<Failure, Transaction>> fulfillTransactionSecureSales(BuildContext context,  Emitter emit, FulfillTransactionObligation event) async {
  final transaction = event.transaction;
  final obligation = event.obligation;
  return SellerFulfilsDelivery(context.read<RemoteDataSource>())
      .execute(transaction, obligation);

}

Future<Either<Failure, Transaction>> complaintTransactionSecureSales(BuildContext context,  Emitter emit, ComplaintTransaction event) async {
  final transaction = event.transaction;
  final note = event.note;
  final user = event.user;
  return MemberMakesComplaint(context.read<RemoteDataSource>())
      .execute(transaction, note, user);
}

Future<Either<Failure, Transaction>> extendTransactionSecureSales(BuildContext context,  Emitter emit, ExtendTransaction event) async {
  final transaction = event.transaction;
  final date = event.date;
  return BuyerExtendsExpiryDate(context.read<RemoteDataSource>())
      .execute(transaction, date);
}