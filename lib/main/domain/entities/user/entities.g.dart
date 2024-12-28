// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profileImage: json['profileImage'] as String,
      email: json['email'] as String,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      fcmToken: json['fcmToken'] as String,
      bvn: json['bvn'] as String,
      businessName: json['businessName'] as String?,
      userStatistics: json['userStatistics'] == null
          ? null
          : UserStatistics.fromJson(
              json['userStatistics'] as Map<String, dynamic>),
      transactionStatistics: json['transactionStatistics'] == null
          ? null
          : TransactionStatistics.fromJson(
              json['transactionStatistics'] as Map<String, dynamic>),
      admin: json['admin'] as bool? ?? false,
      mediator: json['mediator'] as bool? ?? false,
      online: json['online'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profileImage': instance.profileImage,
      'email': instance.email,
      'account': instance.account,
      'fcmToken': instance.fcmToken,
      'bvn': instance.bvn,
      'businessName': instance.businessName,
      'userStatistics': instance.userStatistics,
      'transactionStatistics': instance.transactionStatistics,
      'admin': instance.admin,
      'mediator': instance.mediator,
      'online': instance.online,
    };

_$TransactionStatisticsImpl _$$TransactionStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionStatisticsImpl(
      secureSales: (json['secureSales'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [0, 0, 0],
      billSplitter: (json['billSplitter'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [0, 0, 0],
      betsAndWager: (json['betsAndWager'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [0, 0, 0],
      moneyPool: (json['moneyPool'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [0, 0, 0],
      groupGoals: (json['groupGoals'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [0, 0, 0],
    );

Map<String, dynamic> _$$TransactionStatisticsImplToJson(
        _$TransactionStatisticsImpl instance) =>
    <String, dynamic>{
      'secureSales': instance.secureSales,
      'billSplitter': instance.billSplitter,
      'betsAndWager': instance.betsAndWager,
      'moneyPool': instance.moneyPool,
      'groupGoals': instance.groupGoals,
    };

_$AuthenticationImpl _$$AuthenticationImplFromJson(Map<String, dynamic> json) =>
    _$AuthenticationImpl(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthenticationImplToJson(
        _$AuthenticationImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

_$UserStatisticsImpl _$$UserStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatisticsImpl(
      allTransactions: (json['allTransactions'] as num?)?.toInt() ?? 0,
      created: (json['created'] as num?)?.toInt() ?? 0,
      completed: (json['completed'] as num?)?.toInt() ?? 0,
      pending: (json['pending'] as num?)?.toInt() ?? 0,
      verification: (json['verification'] as num?)?.toInt() ?? 0,
      declined: (json['declined'] as num?)?.toInt() ?? 0,
      accepted: (json['accepted'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserStatisticsImplToJson(
        _$UserStatisticsImpl instance) =>
    <String, dynamic>{
      'allTransactions': instance.allTransactions,
      'created': instance.created,
      'completed': instance.completed,
      'pending': instance.pending,
      'verification': instance.verification,
      'declined': instance.declined,
      'accepted': instance.accepted,
    };

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      name: json['name'] ?? 'no account',
      accountNumber: json['accountNumber'] ?? '102020020',
      balance: json['balance'] ?? 0.0,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'accountNumber': instance.accountNumber,
      'balance': instance.balance,
    };
