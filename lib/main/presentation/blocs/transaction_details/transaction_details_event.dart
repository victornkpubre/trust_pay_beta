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
  const factory TransactionDetailsEvent.acceptTransaction(User user, Transaction transaction, BuildContext context, TransactionDetailsState state) = AcceptTransaction;
  const factory TransactionDetailsEvent.declineTransaction(User user, String note, Transaction transaction, BuildContext context, TransactionDetailsState state) = DeclineTransaction;
  const factory TransactionDetailsEvent.makeTransactionPayment(User user, Obligation obligation, Transaction transaction, BuildContext context, PaymentType paymentType, TransactionDetailsState state) = PaymentTransaction;
  const factory TransactionDetailsEvent.cancelTransaction(User user, Transaction transaction, String note, BuildContext context, TransactionDetailsState state) = CancelTransaction;
  const factory TransactionDetailsEvent.extendTransactionDueDate(User user, DateTime date, Transaction transaction, BuildContext context, TransactionDetailsState state) = ExtendTransaction;
  const factory TransactionDetailsEvent.createTransactionComplaint(User user, String note, Transaction transaction, BuildContext context, TransactionDetailsState state) = ComplaintTransaction;
  const factory TransactionDetailsEvent.fulfillTransactionObligation(User user, Obligation obligation, Transaction transaction, BuildContext context, TransactionDetailsState state) = FulfillTransactionObligation;
  const factory TransactionDetailsEvent.verifyTransactionObligation(User user, Obligation obligation, Transaction transaction, BuildContext context, TransactionDetailsState state) = VerifyTransactionObligation;

}
