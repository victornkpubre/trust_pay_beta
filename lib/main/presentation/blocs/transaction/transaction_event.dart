part of 'transaction_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.getTransaction(int id, TransactionBlocState state) = GetTransaction;
  const factory TransactionEvent.searchTransaction(String text, int pageSize, int page, TransactionBlocState state) = SearchTransaction;
  const factory TransactionEvent.getUsersHistory(int id, int pageSize, int page, TransactionBlocState state) = LoadUserHistory;
  const factory TransactionEvent.createTransaction(Transaction transaction, TransactionBlocState state, File? mediationSource) = CreateTransaction;
  const factory TransactionEvent.updateTransaction(Transaction transaction, TransactionBlocState state) = UpdateTransaction;
  const factory TransactionEvent.setObligationsToken(Transaction transaction, int obligationId, String token, TransactionBlocState state) = SetObligationsToken;
  const factory TransactionEvent.setObligationStatus(Transaction transaction, int obligationId, ObligationStatus status, TransactionBlocState state) = SetObligationStatus;
  const factory TransactionEvent.addObligation(int obligationId, TransactionBlocState state) = AddObligation;
  const factory TransactionEvent.initialNotification(Transaction transaction, User user, String message, TransactionBlocState state) = NotifyMembers;
  const factory TransactionEvent.updateNotification(User? user, int? notificationId, NotificationState notificationState, TransactionBlocState state) = UpdateNotification;
  const factory TransactionEvent.updateLiveTransactions(List<Transaction> transactions, TransactionBlocState state) = UpdateLiveTransaction;
  const factory TransactionEvent.updateTransactionState(TransactionBlocState newState) = UpdateTransactionBlocState;
  const factory TransactionEvent.removeObligation(int obligationId, TransactionBlocState state) = RemoveObligation;
}