import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/domain/usecases/bill_splitter/member_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/member_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/member_cancels_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/member_declines_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/owner_extends_expiry_date.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

import '../../../../domain/usecases/money_pool/owner_makes_payment.dart';

Future<void> acceptTransactionMoneyPool(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final user = event.user;
  final obligation = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment&&o.binding==user.id);
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

Future<void> declineTransactionMoneyPool(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final user = event.user;
  final note = event.note;
  (await MemberDeclinesTransaction(context.read<RemoteDataSource>())
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

Future<void> paymentTransactionMoneyPool(BuildContext context,  Emitter emit, PaymentTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final user = event.user;
  final type = event.paymentType;
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

Future<void> cancelTransactionMoneyPool(BuildContext context,  Emitter emit, CancelTransaction event) async {
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

Future<void> extendTransactionMoneyPool(BuildContext context,  Emitter emit, ExtendTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final date = event.date;

  (await OwnerExtendsExpiryDate(context.read<RemoteDataSource>())
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