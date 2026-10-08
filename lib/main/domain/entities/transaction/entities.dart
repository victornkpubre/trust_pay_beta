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

enum ProofMediaType { image, video }

/// A photo or video taken in-app as evidence for a transaction, with the
/// GPS location of the device when it was captured.
@freezed
class TransactionProof with _$TransactionProof {
  const TransactionProof._();
  const factory TransactionProof({
    int? id,
    required int userId,
    required ProofMediaType mediaType,
    required String url,
    required double latitude,
    required double longitude,
    double? accuracy,
    @Default(false) bool isMocked,
    required DateTime capturedAt,
    @Default([]) List<int> obligationIds,
  }) = _TransactionProof;

  factory TransactionProof.fromJson(Map<String, Object?> json)
    => _$TransactionProofFromJson(json);

  Uri get mapUri => Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
}

@freezed
class Mediation with _$Mediation {
  const Mediation._();
  const factory Mediation({
    int? id,
    required int user_id,
    required int binding,
    required int mediator,
    required String source_type,
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
    @Default('NGN') String currency,
    required DateTime dateCreated,
    required DateTime expiryDate,
    required double percentageComplete,
    required TransactionStatus status,
    required List<Obligation> obligations,
    required List<User> members,
    List<String>? notes,
    Mediation? mediation,
    User? payee,
    int? conversationId,
    // Read-only: proofs are uploaded through their own endpoint, so they
    // are never sent back when the transaction is updated.
    @JsonKey(includeToJson: false) @Default([]) List<TransactionProof> proofs,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json)
    => _$TransactionFromJson(json);

  /// Proofs that cover [obligationId].
  List<TransactionProof> proofsFor(int? obligationId) {
    return proofs.where((p) => p.obligationIds.contains(obligationId)).toList();
  }

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
      notes: notes!=null?jsonEncode(notes): null,
      mediation: mediation!=null?jsonEncode(mediation!.toJson()): null,
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
    Transaction? transaction,
    int? conversationId,
    @Default(NotificationKind.transaction) NotificationKind kind,
    required NotificationState state,
    required String message,
    required DateTime date,
  }) = _Notification;

  factory Notification.fromJson(Map<String, Object?> json)
  => _$NotificationFromJson(json);

  NotificationDTO toNotificationDTO() {
    return NotificationDTO(
      id: id,
      user: jsonEncode(user.toJson()),
      state: jsonEncode(state.toString()),
      transaction: transaction != null ? jsonEncode(transaction!.toJson()) : null,
      date: date
    );
  }
}

