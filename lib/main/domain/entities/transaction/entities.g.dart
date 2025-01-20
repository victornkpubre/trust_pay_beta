// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObligationImpl _$$ObligationImplFromJson(Map<String, dynamic> json) =>
    _$ObligationImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      status: $enumDecode(_$ObligationStatusEnumMap, json['status']),
      type: $enumDecode(_$ObligationTypeEnumMap, json['type']),
      dueDate: DateTime.parse(json['dueDate'] as String),
      amount: (json['amount'] as num).toDouble(),
      binding: (json['binding'] as num?)?.toInt(),
      details: json['details'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$ObligationImplToJson(_$ObligationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': _$ObligationStatusEnumMap[instance.status]!,
      'type': _$ObligationTypeEnumMap[instance.type]!,
      'dueDate': instance.dueDate.toIso8601String(),
      'amount': instance.amount,
      'binding': instance.binding,
      'details': instance.details,
      'token': instance.token,
    };

const _$ObligationStatusEnumMap = {
  ObligationStatus.pending: 'pending',
  ObligationStatus.fulfilled: 'fulfilled',
  ObligationStatus.paid: 'paid',
  ObligationStatus.verified: 'verified',
  ObligationStatus.failed: 'failed',
};

const _$ObligationTypeEnumMap = {
  ObligationType.delivery: 'delivery',
  ObligationType.payment: 'payment',
  ObligationType.payout: 'payout',
};

_$MediationImpl _$$MediationImplFromJson(Map<String, dynamic> json) =>
    _$MediationImpl(
      user: (json['user'] as num).toInt(),
      binding: (json['binding'] as num).toInt(),
      mediator: (json['mediator'] as num).toInt(),
      sourceType: json['sourceType'] as String,
      details: json['details'] as String,
      web: json['web'] as String?,
      video: json['video'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$MediationImplToJson(_$MediationImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'binding': instance.binding,
      'mediator': instance.mediator,
      'sourceType': instance.sourceType,
      'details': instance.details,
      'web': instance.web,
      'video': instance.video,
      'image': instance.image,
    };

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      title: json['title'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      total: (json['total'] as num).toDouble(),
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      percentageComplete: (json['percentageComplete'] as num).toDouble(),
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      obligations: (json['obligations'] as List<dynamic>)
          .map((e) => Obligation.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['note'] as String?,
      mediation: json['mediation'] == null
          ? null
          : Mediation.fromJson((json['mediation'] as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )),
      payee: json['payee'] == null
          ? null
          : User.fromJson(json['payee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'total': instance.total,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'percentageComplete': instance.percentageComplete,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'obligations': instance.obligations,
      'members': instance.members,
      'note': instance.note,
      'mediation': instance.mediation,
      'payee': instance.payee,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.moneyPool: 'moneyPool',
  TransactionType.secureSales: 'secureSales',
  TransactionType.groupGoals: 'groupGoals',
  TransactionType.billSplitter: 'billSplitter',
  TransactionType.betsWagers: 'betsWagers',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.pending: 'pending',
  TransactionStatus.accepted: 'accepted',
  TransactionStatus.declined: 'declined',
  TransactionStatus.verification: 'verification',
  TransactionStatus.completed: 'completed',
};

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: (json['id'] as num?)?.toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      transaction:
          Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      state: $enumDecode(_$NotificationStateEnumMap, json['state']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'transaction': instance.transaction,
      'state': _$NotificationStateEnumMap[instance.state]!,
      'message': instance.message,
    };

const _$NotificationStateEnumMap = {
  NotificationState.sent: 'sent',
  NotificationState.delivered: 'delivered',
  NotificationState.viewed: 'viewed',
};
