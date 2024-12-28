import 'package:json_annotation/json_annotation.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';

import '../../../domain/entities/entities.dart';

part 'responses.g.dart';

@JsonSerializable()
class UsersResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<UserDataResponse>? users;

  UsersResponse();

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    return _$UsersResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UsersResponseToJson(this);
  }
}

@JsonSerializable()
class UserResponse extends BaseResponse {
  @JsonKey(name: "data")
  UserDataResponse? user;

  UserResponse();

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserResponseToJson(this);
  }
}


@JsonSerializable()
class UserDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "business_name")
  String? businessName;
  @JsonKey(name: "profile_image")
  String? profileImage;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "fcm_token")
  String? fcmToken;
  @JsonKey(name: "bvn")
  String? bvn;
  @JsonKey(name: "admin")
  bool? admin;
  @JsonKey(name: "mediator")
  bool? mediator;
  @JsonKey(name: "online")
  bool? online;
  @JsonKey(name: "account")
  AccountResponse? account;
  @JsonKey(name: "user_statistics")
  UserStatisticsResponse? userStatistics;
  @JsonKey(name: "transaction_statistics")
  TransactionStatisticsResponse? transactionStatistics;

  UserDataResponse();

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    return _$UserDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDataResponseToJson(this);
  }
}

@JsonSerializable()
class AccountResponse {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "account_number")
  String? accountNumber;
  @JsonKey(name: "balance")
  double? balance;

  AccountResponse();

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return _$AccountResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccountResponseToJson(this);
  }
}


@JsonSerializable()
class UserStatisticsResponse extends BaseResponse{
  @JsonKey(name: "all_transactions")
  int? allTransactions;
  @JsonKey(name: "created")
  int? created;
  @JsonKey(name: "completed")
  int? completed;
  @JsonKey(name: "pending")
  int? pending;
  @JsonKey(name: "verification")
  int? verification;
  @JsonKey(name: "declined")
  int? declined;
  @JsonKey(name: "accepted")
  int? accepted;

  UserStatisticsResponse();

  factory UserStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return _$UserStatisticsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserStatisticsResponseToJson(this);
  }
}
