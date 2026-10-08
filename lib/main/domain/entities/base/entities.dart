import 'package:trust_pay_beta/main/data/mappers/extensions.dart';

enum TransactionType {
  moneyPool,
  secureSales,
  groupGoals,
  billSplitter,
  betsWagers,
}

enum TransactionStatus { pending, accepted, declined, verification, completed }
enum ObligationStatus { pending, fulfilled, paid, verified, failed }
enum PaymentFrequency {weekly, monthly, annually }
enum ObligationType {delivery, payment, payout, attendance }

extension ObligationTypeX on ObligationType {
  /// Something done in person (handing over goods, or being present) that
  /// the seller fulfils with a token and can back with photo/video proof.
  bool get isFulfilment => this == ObligationType.delivery || this == ObligationType.attendance;

  String get label => switch (this) {
    ObligationType.delivery => 'Delivery',
    ObligationType.payment => 'Payment',
    ObligationType.payout => 'Payout',
    ObligationType.attendance => 'Attendance',
  };
}
enum NotificationState {sent, delivered, viewed }
enum NotificationKind {transaction, message }
enum SplitType { splitEvenly, splitByPercentage, splitManually }
enum TransactionActionType {acceptDecline, fulfilObligations, verifyObligations, makePayment, verifyMediation, viewTransaction}
