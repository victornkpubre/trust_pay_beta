
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
enum PaymentFrequency {weekly, monthly, annually}
enum ObligationType {delivery, payment, payout}
enum NotificationState {sent, delivered, viewed}
