import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class NotificationItemInput {
  final String username;
  final String image;
  final String amount;
  final DateTime createdAt;
  final TransactionInput transaction;
  NotificationItemInput({
    required this.username,
    required this.amount,
    required this.image,
    required this.transaction,
    required this.createdAt,
  });
}

class ObligationInput {
  final String title;
  final double amount;
  final DateTime date;
  final ObligationStatus status;
  final ObligationType type;
  ObligationInput({
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  }): status = ObligationStatus.fulfilled;
}

class TransactionInput {
  final DateTime createdAt;
  final TransactionStatus status;
  final TransactionType type;
  TransactionInput({
    required this.createdAt,
    required this.type,
    required this.status,
  });
}

class TransactionAcceptanceInput {
  final String title;
  final String amount;
  final DateTime date;
  TransactionAcceptanceInput(
      {required this.title, required this.amount, required this.date});
}

class UserTransactionInput {
  final String image;
  final String username;
  final String account;
  final int? totalTransaction;
  final double? completionRate;
  final TransactionStatus status;
  UserTransactionInput(
      {required this.status,
      required this.image,
      required this.username,
      required this.account,
      this.totalTransaction,
      this.completionRate});
}

class UserInput {
  final String image;
  final String username;
  final String account;
  final int? totalTransaction;
  final double? completionRate;
  UserInput(
      {required this.image,
      required this.username,
      required this.account,
      this.totalTransaction,
      this.completionRate});
}

class WebsiteInput {
  final String title;
  final String? image;
  final String url;

  WebsiteInput({
    required this.title, 
    this.image, 
    required this.url});


}
