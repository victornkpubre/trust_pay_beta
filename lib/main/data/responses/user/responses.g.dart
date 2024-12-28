// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..users = (json['data'] as List<dynamic>?)
          ?.map((e) => UserDataResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'data': instance.users,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse()
  ..status = (json['statusCode'] as num?)?.toInt()
  ..message = json['message'] as String?
  ..user = json['data'] == null
      ? null
      : UserDataResponse.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'data': instance.user,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..firstName = json['first_name'] as String?
      ..lastName = json['last_name'] as String?
      ..businessName = json['business_name'] as String?
      ..profileImage = json['profile_image'] as String?
      ..email = json['email'] as String?
      ..fcmToken = json['fcm_token'] as String?
      ..bvn = json['bvn'] as String?
      ..admin = json['admin'] as bool?
      ..mediator = json['mediator'] as bool?
      ..online = json['online'] as bool?
      ..account = json['account'] == null
          ? null
          : AccountResponse.fromJson(json['account'] as Map<String, dynamic>)
      ..userStatistics = json['user_statistics'] == null
          ? null
          : UserStatisticsResponse.fromJson(
              json['user_statistics'] as Map<String, dynamic>)
      ..transactionStatistics = json['transaction_statistics'] == null
          ? null
          : TransactionStatisticsResponse.fromJson(
              json['transaction_statistics'] as Map<String, dynamic>);

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'business_name': instance.businessName,
      'profile_image': instance.profileImage,
      'email': instance.email,
      'fcm_token': instance.fcmToken,
      'bvn': instance.bvn,
      'admin': instance.admin,
      'mediator': instance.mediator,
      'online': instance.online,
      'account': instance.account,
      'user_statistics': instance.userStatistics,
      'transaction_statistics': instance.transactionStatistics,
    };

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) =>
    AccountResponse()
      ..name = json['name'] as String?
      ..accountNumber = json['account_number'] as String?
      ..balance = (json['balance'] as num?)?.toDouble();

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'account_number': instance.accountNumber,
      'balance': instance.balance,
    };

UserStatisticsResponse _$UserStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    UserStatisticsResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..allTransactions = (json['all_transactions'] as num?)?.toInt()
      ..created = (json['created'] as num?)?.toInt()
      ..completed = (json['completed'] as num?)?.toInt()
      ..pending = (json['pending'] as num?)?.toInt()
      ..verification = (json['verification'] as num?)?.toInt()
      ..declined = (json['declined'] as num?)?.toInt()
      ..accepted = (json['accepted'] as num?)?.toInt();

Map<String, dynamic> _$UserStatisticsResponseToJson(
        UserStatisticsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'all_transactions': instance.allTransactions,
      'created': instance.created,
      'completed': instance.completed,
      'pending': instance.pending,
      'verification': instance.verification,
      'declined': instance.declined,
      'accepted': instance.accepted,
    };
