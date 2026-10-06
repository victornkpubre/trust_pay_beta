// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositInitiateResponse _$DepositInitiateResponseFromJson(
        Map<String, dynamic> json) =>
    DepositInitiateResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..link = json['link'] as String?
      ..txRef = json['tx_ref'] as String?
      ..paymentId = (json['payment_id'] as num?)?.toInt()
      ..paymentStatus = json['status'] as String?;

Map<String, dynamic> _$DepositInitiateResponseToJson(
        DepositInitiateResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'link': instance.link,
      'tx_ref': instance.txRef,
      'payment_id': instance.paymentId,
      'status': instance.paymentStatus,
    };

PaymentStatusResponse _$PaymentStatusResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentStatusResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..paymentStatus = json['status'] as String?
      ..amount = (json['amount'] as num?)?.toDouble()
      ..currency = json['currency'] as String?
      ..channel = json['channel'] as String?;

Map<String, dynamic> _$PaymentStatusResponseToJson(
        PaymentStatusResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'status': instance.paymentStatus,
      'amount': instance.amount,
      'currency': instance.currency,
      'channel': instance.channel,
    };

AccountsResponse _$AccountsResponseFromJson(Map<String, dynamic> json) =>
    AccountsResponse()
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?
      ..accounts = (json['data'] as List<dynamic>?)
          ?.map((e) => AccountResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AccountsResponseToJson(AccountsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'data': instance.accounts,
    };
