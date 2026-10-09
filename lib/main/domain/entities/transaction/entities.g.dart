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
  ObligationType.attendance: 'attendance',
};

_$TransactionProofImpl _$$TransactionProofImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionProofImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num).toInt(),
      mediaType: $enumDecode(_$ProofMediaTypeEnumMap, json['mediaType']),
      url: json['url'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      accuracy: (json['accuracy'] as num?)?.toDouble(),
      isMocked: json['isMocked'] as bool? ?? false,
      capturedAt: DateTime.parse(json['capturedAt'] as String),
      obligationIds: (json['obligationIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionProofImplToJson(
        _$TransactionProofImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'mediaType': _$ProofMediaTypeEnumMap[instance.mediaType]!,
      'url': instance.url,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'isMocked': instance.isMocked,
      'capturedAt': instance.capturedAt.toIso8601String(),
      'obligationIds': instance.obligationIds,
    };

const _$ProofMediaTypeEnumMap = {
  ProofMediaType.image: 'image',
  ProofMediaType.video: 'video',
};

_$MediationImpl _$$MediationImplFromJson(Map<String, dynamic> json) =>
    _$MediationImpl(
      id: (json['id'] as num?)?.toInt(),
      user_id: (json['user_id'] as num).toInt(),
      binding: (json['binding'] as num).toInt(),
      mediator: (json['mediator'] as num).toInt(),
      source_type: json['source_type'] as String,
      details: json['details'] as String,
      web: json['web'] as String?,
      video: json['video'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$MediationImplToJson(_$MediationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'binding': instance.binding,
      'mediator': instance.mediator,
      'source_type': instance.source_type,
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
      currency: json['currency'] as String? ?? 'NGN',
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
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      mediation: json['mediation'] == null
          ? null
          : Mediation.fromJson((json['mediation'] as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )),
      payee: json['payee'] == null
          ? null
          : User.fromJson(json['payee'] as Map<String, dynamic>),
      conversationId: (json['conversationId'] as num?)?.toInt(),
      proofs: (json['proofs'] as List<dynamic>?)
              ?.map((e) => TransactionProof.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'total': instance.total,
      'currency': instance.currency,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'percentageComplete': instance.percentageComplete,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'obligations': instance.obligations,
      'members': instance.members,
      'notes': instance.notes,
      'mediation': instance.mediation,
      'payee': instance.payee,
      'conversationId': instance.conversationId,
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
      transaction: json['transaction'] == null
          ? null
          : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
      conversationId: (json['conversationId'] as num?)?.toInt(),
      kind: $enumDecodeNullable(_$NotificationKindEnumMap, json['kind']) ??
          NotificationKind.transaction,
      state: $enumDecode(_$NotificationStateEnumMap, json['state']),
      message: json['message'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'transaction': instance.transaction,
      'conversationId': instance.conversationId,
      'kind': _$NotificationKindEnumMap[instance.kind]!,
      'state': _$NotificationStateEnumMap[instance.state]!,
      'message': instance.message,
      'date': instance.date.toIso8601String(),
    };

const _$NotificationKindEnumMap = {
  NotificationKind.transaction: 'transaction',
  NotificationKind.message: 'message',
};

const _$NotificationStateEnumMap = {
  NotificationState.sent: 'sent',
  NotificationState.delivered: 'delivered',
  NotificationState.viewed: 'viewed',
};
