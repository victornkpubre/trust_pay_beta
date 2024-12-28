import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';
part 'transaction_bloc.freezed.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repository;

  TransactionBloc(this._repository) : super(const _Initial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is LoadUserHistory) {
        await _loadUserHistory(emit, event);
      }
      if(event is GetTransaction) {
        await _getTransaction(emit, event.id);
      }
      if(event is CreateTransaction) {
        await _createTransaction(emit, event.transaction);
      }
      if(event is UpdateTransaction) {
        await _updateTransaction(emit, event.transaction);
      }
      if (event is SetObligationsToken) {
        await _setObligationsToken(emit, event);
      }
      if(event is SetObligationStatus) {
        await _setObligationStatus(emit, event);
      }
    });
  }

  Future<void> _loadUserHistory(emit, event) async {
    emit(const TransactionState(status: TransactionBlocStatus.loading));
    (await _repository.getUserHistory(event.id, event.pageSize, event.page)).fold(
            (failure) {
          toastFailure(failure);
          emit(const TransactionState(status: TransactionBlocStatus.error));
        },
            (entity) {
          emit(TransactionState(transactions: entity, status: TransactionBlocStatus.userHistoryLoaded));
        }
    );
  }

  Future<void> _getTransaction(emit, id) async {
    emit(const TransactionState(status: TransactionBlocStatus.loading));
    (await _repository.getTransaction(id)).fold(
      (failure) {
        toastFailure(failure);
        emit(const TransactionState(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(TransactionState(transaction: entity, status: TransactionBlocStatus.transactionLoaded));
      }
    );
  }

  Future<void> _createTransaction(emit, transaction) async {
    emit(const TransactionState(status: TransactionBlocStatus.loading));
    (await _repository.createTransaction(transaction)).fold(
      (failure) {
        toastFailure(failure);
        emit(const TransactionState(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(TransactionState(transaction: entity, status: TransactionBlocStatus.transactionCreated));
      }
    );
  }

  Future<void> _updateTransaction(emit, transaction) async {
    emit(const TransactionState(status: TransactionBlocStatus.loading));
    (await _repository.updateTransaction(transaction)).fold(
      (failure) {
        toastFailure(failure);
        emit(const TransactionState(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(TransactionState(transaction: entity, status: TransactionBlocStatus.transactionUpdated));
      }
    );
  }

  Future<void> _setObligationsToken(emit, SetObligationsToken event) async {
    emit(const TransactionState(status: TransactionBlocStatus.loading));
    Obligation? obligation = event.transaction.obligations.where((o) => o.id == event.obligationId).firstOrNull;

    if(event.transaction.id == null || obligation == null) {
      emit(const TransactionState(status: TransactionBlocStatus.error));
    }

    (await _repository.setObligationToken(event.transaction.id!, obligation!, event.token)).fold(
      (failure) {
        toastFailure(failure);
        emit(const TransactionState(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(const TransactionState(status: TransactionBlocStatus.obligationUpdated));
      }
    );
  }

  Future<void> _setObligationStatus(emit, SetObligationStatus event) async {
    emit(const TransactionState(status: TransactionBlocStatus.loading));
    Obligation? obligation = event.transaction.obligations.where((o) => o.id == event.obligationId).firstOrNull;

    if(event.transaction.id == null || obligation == null) {
      emit(const TransactionState(status: TransactionBlocStatus.error));
    }

    (await _repository.setObligationStatus(event.transaction.id!, obligation!, event.status)).fold(
      (failure) {
        toastFailure(failure);
        emit(const TransactionState(status: TransactionBlocStatus.error));
      },
      (entity) {
        emit(const TransactionState(status: TransactionBlocStatus.obligationUpdated));
      }
    );
  }

}