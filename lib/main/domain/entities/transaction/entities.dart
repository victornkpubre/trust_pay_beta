import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/database.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

part 'entities.freezed.dart';
part 'entities.g.dart';

@freezed
class Obligation with _$Obligation {
  const Obligation._(); 
  const factory Obligation({
    int? id,
    required String title,
    required final ObligationStatus status,
    required final ObligationType type,
    required final DateTime dueDate,
    required double amount,
    int? binding,
    String? details,
    String? token,
  }) = _Obligation;

  factory Obligation.fromJson(Map<String, Object?> json)
    => _$ObligationFromJson(json);

  ObligationInput toObligationInput() {
    return ObligationInput(
      title: title, 
      amount: amount, 
      date: dueDate, 
      type: type, 
    );
  }

  ObligationDTO toObligationDTO(int transactionId) {
    return ObligationDTO(
      id: id,
      transactionId: transactionId,
      title: title, 
      type: type.name,
      status: status.name,
      amount: amount, 
      details: details, 
      token: token, 
      binding: binding, 
    );
  }
}

@freezed
class Mediation with _$Mediation {
  const Mediation._();
  const factory Mediation({
    required int user,
    required int binding,
    required int mediator,
    required String sourceType,
    required String details,
    String? web,
    String? video,
    String? image,
  }) = _Mediation;

  factory Mediation.fromJson(Map<String, Object> json) 
    => _$MediationFromJson(json);

  String? getUrl(){
    return web??video??image;
  }
}

@freezed
class Transaction with _$Transaction {
  const Transaction._();
  const factory Transaction({
    int? id,
    int? userId,
    required String title,
    required TransactionType type,
    required double total,
    required DateTime dateCreated,
    required DateTime expiryDate,
    required double percentageComplete,
    required TransactionStatus status,
    required List<Obligation> obligations,
    required List<User> members,
    String? note,
    Mediation? mediation,
    User? payee,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json)
    => _$TransactionFromJson(json);

  TransactionInput toTransactionInput() {
    return TransactionInput(
      type: type,
      createdAt: dateCreated,
      status: status
    );
  }
  TransactionDTO toTransactionDTO() {
    return TransactionDTO(
      id: id,
      userId: userId,
      title: title,
      type: type.name,
      status: status.name,
      total: total,
      percentageComplete: percentageComplete,
      dateCreated: dateCreated,
      expiryDate: expiryDate,
      note: note,
      mediation: mediation!=null?jsonEncode(mediation!.toJson()): null,
      payee: payee!=null?jsonEncode(payee!.toJson()): null,
      members: jsonEncode(members.map((m) => m.id).toList())
    );
  }
}

@freezed
class Notification with _$Notification {
  const Notification._();
  const factory Notification({
    int? id,
    required User user,
    required Transaction transaction,
    required NotificationState state,
    required String message,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json)
  => _$NotificationFromJson(json);

  NotificationDTO toNotificationDTO() {
    return NotificationDTO(
      id: id,
      user: jsonEncode(user.toJson()),
      state: jsonEncode(state.toString()),
      transaction: jsonEncode(transaction.toJson())
    );
  }
}

