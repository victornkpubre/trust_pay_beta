part of 'transaction_bloc.dart';

enum TransactionBlocStatus {
  initial,
  loading,
  transactionLoaded,
  userHistoryLoaded,
  transactionCreated,
  transactionUpdated,
  obligationUpdated,
  error
}

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    @Default(TransactionBlocStatus.initial) TransactionBlocStatus status,
    @Default(null) Transaction? transaction,
    @Default(null) List<Transaction>? transactionHistory,
    @Default(null) List<Transaction>? liveTransactions,
  }) = _Initial;
}