import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_cancels_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_declines_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/owner_makes_payment.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

Future<void> acceptTransactionBillSplitter(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final obligation = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment&&o.binding==event.user.id);
  (await MemberAcceptsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, obligation)).fold(
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

Future<void> declineTransactionBillSplitter(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final note = event.note;
  final obligation = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment&&o.binding==event.user.id);
  (await MemberDeclinesTransaction(context.read<RemoteDataSource>())
      .execute(transaction, note, obligation)).fold(
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

Future<void> paymentTransactionBillSplitter(BuildContext context,  Emitter emit, PaymentTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final type = event.paymentType;
  final user = event.user;
  final obligation = event.obligation;

  if(user.id == transaction.userId) {
    (await OwnerMakesPayment(context.read<RemoteDataSource>())
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
  else {
    (await MemberMakesPayment(context.read<RemoteDataSource>())
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

}

Future<void> cancelTransactionBillSplitter(BuildContext context, Emitter emit, CancelTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final user = event.user;
  (await MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user)).fold(
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

Future<void> extendTransactionBillSplitter(BuildContext context,  Emitter emit, ExtendTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final user = event.user;
  (await MemberCancelsTransaction(context.read<RemoteDataSource>())
      .execute(transaction, user)).fold(
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
