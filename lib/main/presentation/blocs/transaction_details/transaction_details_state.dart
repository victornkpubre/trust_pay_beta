part of 'transaction_details_bloc.dart';

enum TransactionDetailsBlocStatus {
  initial,
  initiated,
  loading,
  transactionComplete,
  error
}

@freezed
class TransactionDetailsState with _$TransactionDetailsState {
  const factory TransactionDetailsState({
    @Default(TransactionDetailsBlocStatus.initial) TransactionDetailsBlocStatus state,
    @Default(null) Transaction? transaction,
    @Default('') String errorMessage,
    @Default(null)  Obligation? obligation,
    required List<String> tokens,
    required List<bool> tokenVisibilities,
    required List<bool> payoutVisibilities,
    required List<bool> fulfilmentVisibilities,
    required Set<DateTime> fulfilmentDates
  }) = _Initial;
}