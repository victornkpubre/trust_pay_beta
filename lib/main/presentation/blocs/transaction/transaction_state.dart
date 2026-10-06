part of 'transaction_bloc.dart';

enum TransactionBlocStatus {
  initial,
  loading,
  transactionLoaded,
  liveTransactionsUpdated,
  userHistoryLoaded,
  transactionCreated,
  transactionUpdated,
  obligationUpdated,
  error
}

@freezed
class TransactionBlocState with _$TransactionBlocState {
  const factory TransactionBlocState({
    @Default(TransactionBlocStatus.initial) TransactionBlocStatus status,
    @Default(null) String? message,
    @Default(null) Transaction? transaction,
    @Default(null) List<Transaction>? transactionSearchResult,
    @Default(null) List<Transaction>? transactionHistory,
    @Default(null) List<Transaction>? liveTransactions,
  }) = _Initial;
}