part of 'transaction_details_bloc.dart';

@freezed
class TransactionDetailsEvent with _$TransactionDetailsEvent {
  const factory TransactionDetailsEvent.init(Transaction transaction) = Init;
  const factory TransactionDetailsEvent.toggleTokenVisibility(int index, TransactionDetailsState state) = ToggleTokenVisibility;
  const factory TransactionDetailsEvent.toggleFulfilmentVisibility(int index, TransactionDetailsState state) = ToggleFulfilmentVisibility;
  const factory TransactionDetailsEvent.togglePayoutVisibilities(int index, TransactionDetailsState state) = TogglePayoutVisibilities;
  const factory TransactionDetailsEvent.addToken(int id, String token,TransactionDetailsState state, Transaction transaction) = AddToken;
  const factory TransactionDetailsEvent.setObligationStatus(int id, ObligationStatus status,TransactionDetailsState state, Transaction transaction) = SetObligationStatus;
  const factory TransactionDetailsEvent.verifyToken(int id, String token, Obligation obligation, TransactionDetailsState state) = VerifyObligation;
}
