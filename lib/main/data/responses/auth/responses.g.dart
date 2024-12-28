// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      json['token'] as String?,
      json['user'] == null
          ? null
          : UserDataResponse.fromJson(json['user'] as Map<String, dynamic>),
    )
      ..status = (json['statusCode'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
