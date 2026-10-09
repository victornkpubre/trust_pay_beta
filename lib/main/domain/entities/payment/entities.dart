/// A started hosted-checkout session for a real-money wallet deposit.
class DepositCheckout {
  final String link;
  final String txRef;
  final int paymentId;
  final String status;

  const DepositCheckout({
    required this.link,
    required this.txRef,
    required this.paymentId,
    required this.status,
  });
}

/// Point-in-time status of a deposit, used to drive the pending screen.
class PaymentStatus {
  final String status;
  final double amount;
  final String currency;
  final String? channel;

  const PaymentStatus({
    required this.status,
    required this.amount,
    required this.currency,
    this.channel,
  });

  bool get isSuccessful => status == 'successful';
  bool get isFailed => status == 'failed';
  bool get isPending => status == 'pending';

  /// Bacs Direct Debit (UK real-bank-account payments) settles 1-3 business
  /// days later, unlike card/Paystack which confirm in seconds.
  bool get isSlowBankDebit => channel == 'bacs_debit';
}
