import 'package:intl/intl.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

/// Expiry dates are whole days at midnight (00:00), so "today" has already
/// started and counts as past — the earliest valid expiry is tomorrow. The
/// API enforces the same rule when a transaction is created.

/// A specific failure when [transaction] has expired, checked before the
/// other accept/pay rules so the user sees why rather than a generic
/// "Invalid Transaction State".
Failure? expiredTransactionFailure(Transaction transaction) {
  if (!transaction.expiryDate.isBefore(DateTime.now())) return null;
  return Failure(300, 'This transaction expired on ${DateFormat('d MMM yyyy').format(transaction.expiryDate)}.');
}

DateTime earliestExpiryDate() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day + 1);
}

bool isFutureExpiry(DateTime? date) => date != null && date.isAfter(DateTime.now());

const String pastExpiryMessage = 'Choose an expiry date from tomorrow onwards.';
