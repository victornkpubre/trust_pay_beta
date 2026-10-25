import 'package:trust_pay_beta/main/domain/entities/entities.dart';

TransactionActionType getTransactionAction(Transaction transaction, int currentUserId) {
  // Any transaction type: waiting on this user to approve a new expiry date.
  final extensionReview = extensionReviewTest(transaction, currentUserId);
  if (extensionReview != null) return extensionReview;

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
      
    case TransactionType.moneyPool:
      return multiPendingAcceptanceTest(transaction, currentUserId)??
          moneyPoolPaymentDueTest(transaction, currentUserId)??
          TransactionActionType.viewTransaction;
    default:
      return TransactionActionType.viewTransaction;
  }
}

/// Another member asked to move the expiry date and is waiting on this user.
TransactionActionType? extensionReviewTest(Transaction transaction, int currentUserId) {
  if(transaction.isActive && transaction.hasExtensionRequest
      && transaction.extensionApproversLeft.any((u) => u.id==currentUserId)) {
    return TransactionActionType.reviewExtension;
  }
  return null;
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
  bool userPaymentVerificationDue = transaction.obligations.any((o) => o.binding==currentUserId && o.type==ObligationType.payment && o.status==ObligationStatus.pending);
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
  final currentUserPayments = transaction.obligations.where((o) => o.type==ObligationType.payment  && o.binding==currentUserId).toList()
    ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  if(currentUserPayments.isEmpty) return null;
  // With a single payment there is no cycle, so any upcoming payment counts as due
  final int? cycleDurationInDays = currentUserPayments.length > 1
    ? currentUserPayments[1].dueDate.difference(currentUserPayments[0].dueDate).inDays
    : null;
  bool currentUserNextPaymentDue = currentUserPayments.fold(false, (prev, o) {
    if(prev==true) return true;
    bool nextPaymentIsDue = false;
    if(o.dueDate.isAfter(DateTime.now())) {
      final daysUntilNextPayment = o.dueDate.difference(DateTime.now()).inDays;
      nextPaymentIsDue = cycleDurationInDays == null || daysUntilNextPayment < cycleDurationInDays;
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
  bool userHasPendingDelivery = transaction.obligations.where((o) => o.type.isFulfilment  && o.binding==currentUserId).fold(false, (prev, o) {
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
  bool transactionHasUnVerifiedFulfilments = transaction.obligations.where((o) => o.type.isFulfilment).fold(false, (prev, o) {
    if(prev==true) return true;
    return o.status==ObligationStatus.fulfilled;
  });

  if(currentUserIdIsOwner && transactionVerifying && transactionHasUnVerifiedFulfilments) {
    return TransactionActionType.verifyObligations;
  }
  return null;
}


