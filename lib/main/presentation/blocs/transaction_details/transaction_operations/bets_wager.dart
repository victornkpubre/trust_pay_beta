
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/bettor_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/bettor_declines_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/bettor_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/mediator_makes_complaint.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/mediator_verifies_assertion.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/member_cancels_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/member_makes_complaint.dart';
import 'package:trust_pay_beta/main/domain/usecases/bets_wagers/owner_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/money_pool/owner_extends_expiry_date.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/buyer_makes_payment.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/seller_accepts_transaction.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/seller_declines_transaction.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

Future<void> acceptTransactionBetsWager(BuildContext context,  Emitter emit, AcceptTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  (await BettorAcceptsTransaction(context.read<RemoteDataSource>())
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

Future<void> declineTransactionBetsWager(BuildContext context,  Emitter emit, DeclineTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final note = event.note;
  (await BettorDeclinesTransaction(context.read<RemoteDataSource>())
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

Future<void> paymentTransactionBetsWager(BuildContext context, Emitter emit, PaymentTransaction event) async {
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
    (await BettorMakesPayment(context.read<RemoteDataSource>())
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

Future<void> cancelTransactionBetsWager(BuildContext context,  Emitter emit, CancelTransaction event) async {
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

Future<void> verifyTransactionBetsWager(BuildContext context,  Emitter emit, VerifyTransactionObligation event, PaymentType type) async {
  final transaction = event.transaction;
  final state = event.state;
  final user = event.user;

  (await MediatorVerifiesAssertion(context.read<RemoteDataSource>())
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

Future<void> complaintTransactionBetsWager(BuildContext context,  Emitter emit, ComplaintTransaction event) async {
  final transaction = event.transaction;
  final state = event.state;
  final note = event.note;
  final user = event.user;

  if(user.id==transaction.mediation?.mediator){
    (await MediatorMakesComplaint(context.read<RemoteDataSource>())
        .execute(transaction, note)).fold(
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
}

Future<void> extendTransactionBetsWager(BuildContext context,  Emitter emit, ExtendTransaction event) async {
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