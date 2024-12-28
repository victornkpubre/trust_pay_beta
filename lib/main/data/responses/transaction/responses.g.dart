// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponse _$UpdateResponseFromJson(Map<String, dynamic> json) =>
    UpdateResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..success = json['data'] as bool?;

Map<String, dynamic> _$UpdateResponseToJson(UpdateResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'data': instance.success,
    };

TransactionsResponse _$TransactionsResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionsResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..transactions = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              TransactionResponseData.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TransactionsResponseToJson(
        TransactionsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'data': instance.transactions,
    };

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) =>
    TransactionResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..transaction = json['data'] == null
          ? null
          : TransactionResponseData.fromJson(
              json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'data': instance.transaction,
    };

TransactionStatisticsResponse _$TransactionStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionStatisticsResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..money_pool = (json['money_pool'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..secure_sales = (json['secure_sales'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..group_goals = (json['group_goals'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..bill_splitter = (json['bill_splitter'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList()
      ..bets_wager = (json['bets_wager'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList();

Map<String, dynamic> _$TransactionStatisticsResponseToJson(
        TransactionStatisticsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'money_pool': instance.money_pool,
      'secure_sales': instance.secure_sales,
      'group_goals': instance.group_goals,
      'bill_splitter': instance.bill_splitter,
      'bets_wager': instance.bets_wager,
    };

TransactionResponseData _$TransactionResponseDataFromJson(
        Map<String, dynamic> json) =>
    TransactionResponseData()
      ..id = (json['id'] as num?)?.toInt()
      ..userId = (json['user_id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..type = json['type'] as String?
      ..transactionStatus = json['status'] as String?
      ..total = (json['total_amount'] as num?)?.toDouble()
      ..percentage = (json['percentage'] as num?)?.toDouble()
      ..payee = (json['payee'] as num?)?.toInt()
      ..dateCreated = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..expiryDate = json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String)
      ..obligations = (json['obligations'] as List<dynamic>?)
          ?.map((e) => ObligationResponse.fromJson(e as Map<String, dynamic>))
          .toList()
      ..members = (json['users'] as List<dynamic>?)
          ?.map((e) => UserDataResponse.fromJson(e as Map<String, dynamic>))
          .toList()
      ..note = json['note'] == null
          ? null
          : NoteResponse.fromJson(json['note'] as Map<String, dynamic>)
      ..mediation = json['mediation'] == null
          ? null
          : MediationResponse.fromJson(
              json['mediation'] as Map<String, dynamic>);

Map<String, dynamic> _$TransactionResponseDataToJson(
        TransactionResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'type': instance.type,
      'status': instance.transactionStatus,
      'total_amount': instance.total,
      'percentage': instance.percentage,
      'payee': instance.payee,
      'created_at': instance.dateCreated?.toIso8601String(),
      'expires_at': instance.expiryDate?.toIso8601String(),
      'obligations': instance.obligations,
      'users': instance.members,
      'note': instance.note,
      'mediation': instance.mediation,
    };

ObligationResponse _$ObligationResponseFromJson(Map<String, dynamic> json) =>
    ObligationResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..obligationStatus = json['status'] as String?
      ..type = json['type'] as String?
      ..binding = (json['binding'] as num?)?.toInt()
      ..expiresAt = json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String)
      ..token = json['token'] == null
          ? null
          : ObligationTokenResponse.fromJson(
              json['token'] as Map<String, dynamic>)
      ..amount = json['amount'] == null
          ? null
          : ObligationAmountResponse.fromJson(
              json['amount'] as Map<String, dynamic>)
      ..details = json['details'] == null
          ? null
          : ObligationDetailsResponse.fromJson(
              json['details'] as Map<String, dynamic>);

Map<String, dynamic> _$ObligationResponseToJson(ObligationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'id': instance.id,
      'title': instance.title,
      'status': instance.obligationStatus,
      'type': instance.type,
      'binding': instance.binding,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'token': instance.token,
      'amount': instance.amount,
      'details': instance.details,
    };

ObligationTokenResponse _$ObligationTokenResponseFromJson(
        Map<String, dynamic> json) =>
    ObligationTokenResponse()
      ..id = (json['id'] as num?)?.toInt()
      ..value = json['value'] as String?;

Map<String, dynamic> _$ObligationTokenResponseToJson(
        ObligationTokenResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };

ObligationAmountResponse _$ObligationAmountResponseFromJson(
        Map<String, dynamic> json) =>
    ObligationAmountResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..amount = (json['amount'] as num?)?.toDouble();

Map<String, dynamic> _$ObligationAmountResponseToJson(
        ObligationAmountResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'id': instance.id,
      'amount': instance.amount,
    };

ObligationDetailsResponse _$ObligationDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ObligationDetailsResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..details = json['details'] as String?;

Map<String, dynamic> _$ObligationDetailsResponseToJson(
        ObligationDetailsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'id': instance.id,
      'details': instance.details,
    };

MediationResponse _$MediationResponseFromJson(Map<String, dynamic> json) =>
    MediationResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..mediator = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..createdBy = (json['created_by'] as num?)?.toInt()
      ..bindingTo = (json['binding'] as num?)?.toInt()
      ..sourceType = json['source_type'] as String?
      ..details = json['details'] as String?
      ..web = json['web'] as String?
      ..video = json['video'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$MediationResponseToJson(MediationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'id': instance.id,
      'user': instance.mediator,
      'created_by': instance.createdBy,
      'binding': instance.bindingTo,
      'source_type': instance.sourceType,
      'details': instance.details,
      'web': instance.web,
      'video': instance.video,
      'image': instance.image,
    };

NoteResponse _$NoteResponseFromJson(Map<String, dynamic> json) => NoteResponse()
  ..status = (json['statusCode'] as num?)?.toInt()
  ..message = json['message'] as String?
  ..id = (json['id'] as num?)?.toInt()
  ..transactions = json['details'] as String?;

Map<String, dynamic> _$NoteResponseToJson(NoteResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'id': instance.id,
      'details': instance.transactions,
    };

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..id = (json['id'] as num?)?.toInt()
      ..user = json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>)
      ..transaction = json['transaction'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transaction'] as Map<String, dynamic>)
      ..notificationState = json['state'] as String?;

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'id': instance.id,
      'user': instance.user,
      'transaction': instance.transaction,
      'state': instance.notificationState,
    };
