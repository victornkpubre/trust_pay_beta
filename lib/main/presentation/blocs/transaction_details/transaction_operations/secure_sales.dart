import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
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

Future<void> acceptTransactionSecureSales(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  (await SellerAcceptTransaction(context.read<RemoteDataSource>())
      .execute(transaction)).fold(
      (failure) {
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}

Future<void> declineTransactionSecureSales(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final note = event.note;
  (await SellerDeclinesTransaction(context.read<RemoteDataSource>())
      .execute(transaction, note)).fold(
      (failure) {
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}

Future<void> paymentTransactionSecureSales(BuildContext context,  Emitter emit, PaymentTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final type = event.paymentType;
  final obligation = event.obligation;

  (await BuyerMakesPayment(context.read<RemoteDataSource>())
      .execute(transaction, obligation, type)).fold(
      (failure){
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}

Future<void> cancelTransactionSecureSales(BuildContext context,  Emitter emit, CancelTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final note = event.note;
  final user = event.user;
  (await MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user, note)).fold(
      (failure){
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}

Future<void> verifyTransactionSecureSales(BuildContext context,  Emitter emit, VerifyTransactionObligation event) async {
  final transaction = event.transaction;
  final state = event.state;
  final obligation = event.obligation;
  (await BuyerVerifiesFulfilment(context.read<RemoteDataSource>())
      .execute(transaction, obligation)).fold(
      (failure){
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}

Future<void> fulfillTransactionSecureSales(BuildContext context,  Emitter emit, FulfillTransactionObligation event) async {
  final transaction = event.transaction;
  final state = event.state;
  final obligation = event.obligation;
  (await SellerFulfilsDelivery(context.read<RemoteDataSource>())
      .execute(transaction, obligation)).fold(
      (failure){
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}

Future<void> complaintTransactionSecureSales(BuildContext context,  Emitter emit, ComplaintTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final note = event.note;
  final user = event.user;
  (await MemberMakesComplaint(context.read<RemoteDataSource>())
      .execute(transaction, note, user)).fold(
      (failure){
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}

Future<void> extendTransactionSecureSales(BuildContext context,  Emitter emit, ExtendTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final date = event.date;
  (await BuyerExtendsExpiryDate(context.read<RemoteDataSource>())
      .execute(transaction, date)).fold(
      (failure){
        emit(state.copyWith(
          state: TransactionDetailsBlocStatus.error,
        ));
      },
      (entity) {
        emit(state.copyWith(transaction: transaction));
      }
  );
}