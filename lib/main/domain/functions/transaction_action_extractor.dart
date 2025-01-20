import 'package:trust_pay_beta/main/domain/entities/entities.dart';

TransactionActionType getTransactionAction(Transaction transaction, int currentUserId) {
  switch (transaction.type) {
    case TransactionType.secureSales:
      return pendingAcceptanceTest(transaction, currentUserId)?? 
         paymentPendingTest(transaction, currentUserId)??
         secureSalesFulfillmentDueTest(transaction, currentUserId)??
         secureSalesVerificationDueTest(transaction, currentUserId)??
         TransactionActionType.viewTransaction;
      
    case TransactionType.billSplitter:
      return multiPendingAcceptanceTest(transaction, currentUserId)??
          billSplitterPaymentDueTest(transaction, currentUserId)??
          TransactionActionType.viewTransaction;
      
    case TransactionType.betsWagers:
      return pendingAcceptanceTest(transaction, currentUserId)??
          paymentPendingTest(transaction, currentUserId)??
          betsWagerMediationDueTest(transaction, currentUserId)??
          TransactionActionType.viewTransaction;
      
    case TransactionType.moneyPool:
      return multiPendingAcceptanceTest(transaction, currentUserId)??
          moneyPoolPaymentDueTest(transaction, currentUserId)??
          TransactionActionType.viewTransaction;
    default:
      return TransactionActionType.viewTransaction;
  }
}

TransactionActionType? pendingAcceptanceTest(Transaction transaction, int currentUserId) {
  bool pendingTransactionAndUserNotOwner = transaction.status==TransactionStatus.pending && transaction.userId!=currentUserId;
  if(pendingTransactionAndUserNotOwner) {
    return TransactionActionType.acceptDecline;
  }
  return null;
}

TransactionActionType? multiPendingAcceptanceTest(Transaction transaction, int currentUserId) {
  bool pendingTransactionAndUserNotOwner = transaction.status==TransactionStatus.pending && transaction.userId!=currentUserId;
  bool userPaymentVerificationDue = transaction.obligations.firstWhere((o) => o.binding==currentUserId && o.type==ObligationType.payment).status==ObligationStatus.pending;
  if(pendingTransactionAndUserNotOwner && userPaymentVerificationDue) {
    return TransactionActionType.acceptDecline;
  }
  return null;
}

TransactionActionType? paymentPendingTest(Transaction transaction, int currentUserId) {
  bool currentUserIdIsOwner = currentUserId == transaction.userId;
  bool transactionAccepted = transaction.status==TransactionStatus.accepted;
  bool ownerPaymentDue = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment && o.binding==currentUserId).status == ObligationStatus.pending;
  if(currentUserIdIsOwner && transactionAccepted && ownerPaymentDue){
    return TransactionActionType.makePayment;
  }
  return null;
}

TransactionActionType? billSplitterPaymentDueTest(Transaction transaction, int currentUserId) {
  bool transactionAccepted = transaction.status==TransactionStatus.accepted;
  bool paymentVerified = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment  && o.binding==currentUserId).status == ObligationStatus.verified;
  if(transactionAccepted && paymentVerified){
    return TransactionActionType.makePayment;
  }
  return null;
}

TransactionActionType? moneyPoolPaymentDueTest(Transaction transaction, int currentUserId) {
  bool transactionAcceptedOrVerifying = transaction.status==TransactionStatus.accepted || transaction.status==TransactionStatus.verification;
  bool userCurrentMonthPaymentVerified = transaction.obligations.firstWhere((o) => o.type==ObligationType.payment  && o.binding==currentUserId && o.dueDate.month==DateTime.now().month).status == ObligationStatus.verified;
  if(transactionAcceptedOrVerifying && userCurrentMonthPaymentVerified) {
    return TransactionActionType.makePayment;
  }
  return null;
}

TransactionActionType? secureSalesFulfillmentDueTest(Transaction transaction, int currentUserId) {
  bool currentUserIdIsOwner = currentUserId == transaction.userId;
  bool transactionVerifying = transaction.status==TransactionStatus.verification;
  bool userHasPendingDelivery = transaction.obligations.where((o) => o.type==ObligationType.delivery  && o.binding==currentUserId).fold(true, (prev, o) {
    if(prev==false) return false;
    return o.status!=ObligationStatus.pending;
  });
  if(!currentUserIdIsOwner && transactionVerifying && userHasPendingDelivery) {
    return TransactionActionType.fulfilObligations;
  }
  return null;
}

TransactionActionType? secureSalesVerificationDueTest(Transaction transaction, int currentUserId) {
  bool currentUserIdIsOwner = currentUserId == transaction.userId;
  bool transactionVerifying = transaction.status==TransactionStatus.verification;
  bool transactionHasUnVerifiedFulfilments = transaction.obligations.where((o) => o.type==ObligationType.delivery).fold(false, (prev, o) {
    if(prev==true) return true;
    return o.status==ObligationStatus.fulfilled;
  });

  if(currentUserIdIsOwner && transactionVerifying && transactionHasUnVerifiedFulfilments) {
    return TransactionActionType.verifyObligations;
  }
  return null;
}

TransactionActionType? betsWagerMediationDueTest(Transaction transaction, int currentUserId) {
  bool transactionVerifying = transaction.status==TransactionStatus.verification;
  bool payoutIsPendingVerification = transaction.obligations.firstWhere((o) => o.type==ObligationType.payout).status==ObligationStatus.pending;
  if(transactionVerifying && payoutIsPendingVerification) {
    return TransactionActionType.verifyMediation;
  }
  return null;
}


