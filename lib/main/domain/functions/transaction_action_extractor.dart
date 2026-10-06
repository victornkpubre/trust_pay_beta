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
  bool currentUserNotMediator = transaction.mediation?.mediator!=currentUserId;
  if(pendingTransactionAndUserNotOwner && currentUserNotMediator) {
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
  bool currentUserPaymentDue = transaction.obligations.where((o) => o.type==ObligationType.payment && o.binding==currentUserId).fold(false, (prev, value) {
    if(prev == true) return true;
    if(value.status==ObligationStatus.pending) return true;
    return false;
  });
  bool transactionAccepted = transaction.status==TransactionStatus.accepted;

  if(transactionAccepted && currentUserPaymentDue) {
    return TransactionActionType.makePayment;
  }

  return null;
}

TransactionActionType? billSplitterPaymentDueTest(Transaction transaction, int currentUserId) {
  bool transactionVerified = currentUserId==transaction.userId?
    transaction.status==TransactionStatus.accepted:
    transaction.status==TransactionStatus.verification;
  bool paymentVerified = transaction.obligations.where((o) => o.type==ObligationType.payment  && o.binding==currentUserId).fold(false, (prev, o) {
    if(prev==true) return true;
    return o.status==ObligationStatus.verified;
  });

  if(transactionVerified && paymentVerified){
    return TransactionActionType.makePayment;
  }
  return null;
}

TransactionActionType? moneyPoolPaymentDueTest(Transaction transaction, int currentUserId) {
  bool transactionAcceptedOrVerifying = transaction.status==TransactionStatus.accepted || transaction.status==TransactionStatus.verification;
  final currentUserPayments = transaction.obligations.where((o) => o.type==ObligationType.payment  && o.binding==currentUserId).toList();
  final cycleDurationInDays = currentUserPayments[1].dueDate.difference(currentUserPayments[0].dueDate).inDays;
  bool currentUserNextPaymentDue = currentUserPayments.fold(false, (prev, o) {
    if(prev==true) return true;
    bool nextPaymentIsDue = false;
    if(o.dueDate.isAfter(DateTime.now())) {
      final daysUntilNextPayment = o.dueDate.difference(DateTime.now()).inDays;
      nextPaymentIsDue = daysUntilNextPayment < cycleDurationInDays;
    }
    return nextPaymentIsDue;
  });

  if(transactionAcceptedOrVerifying && currentUserNextPaymentDue) {
    return TransactionActionType.makePayment;
  }
  return null;
}

TransactionActionType? secureSalesFulfillmentDueTest(Transaction transaction, int currentUserId) {
  bool currentUserIdIsOwner = currentUserId == transaction.userId;
  bool transactionVerifying = transaction.status==TransactionStatus.verification;
  bool userHasPendingDelivery = transaction.obligations.where((o) => o.type==ObligationType.delivery  && o.binding==currentUserId).fold(false, (prev, o) {
    if(prev==true) return true;
    return o.status==ObligationStatus.pending;
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
  bool currentUserIsTheMediator = currentUserId==transaction.mediation?.mediator;
  bool transactionVerifying = transaction.status==TransactionStatus.verification;
  bool aPayoutIsPending = transaction.obligations.where((o)
    => o.type==ObligationType.payout).fold(false, (prev, o) {
    if(prev==true) return true;
    return o.status==ObligationStatus.pending;
  });
  if(transactionVerifying && aPayoutIsPending && currentUserIsTheMediator) {
    return TransactionActionType.verifyMediation;
  }
  return null;
}


