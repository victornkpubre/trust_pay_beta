part of 'transaction_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.getTransaction(int id) = GetTransaction;
  const factory TransactionEvent.getUsersHistory(int id, int pageSize, int page) = LoadUserHistory;
  const factory TransactionEvent.createTransaction(Transaction transaction) = CreateTransaction;
  const factory TransactionEvent.updateTransaction(Transaction transaction) = UpdateTransaction;
  const factory TransactionEvent.setObligationsToken(Transaction transaction, int obligationId, String token) = SetObligationsToken;
  const factory TransactionEvent.setObligationStatus(Transaction transaction, int obligationId, ObligationStatus status) = SetObligationStatus;
  const factory TransactionEvent.addObligation(int obligationId) = AddObligation;
  const factory TransactionEvent.removeObligation(int obligationId) = RemoveObligation;
}