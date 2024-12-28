import 'package:json_annotation/json_annotation.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

part 'responses.g.dart';

@JsonSerializable()
class UpdateResponse extends BaseResponse {
  @JsonKey(name: "data")
  bool? success;

  UpdateResponse();

  factory UpdateResponse.fromJson(Map<String, dynamic> json) {
    return _$UpdateResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateResponseToJson(this);
  }
}

@JsonSerializable()
class TransactionsResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<TransactionResponseData>? transactions;

  TransactionsResponse();

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) {
    return _$TransactionsResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionsResponseToJson(this);
  }
}

@JsonSerializable()
class TransactionResponse extends BaseResponse {
  @JsonKey(name: "data")
  TransactionResponseData? transaction;

  TransactionResponse();

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return _$TransactionResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionResponseToJson(this);
  }
}

@JsonSerializable()
class TransactionStatisticsResponse extends BaseResponse {
  @JsonKey(name: "money_pool")
  List<int>? money_pool;

  @JsonKey(name: "secure_sales")
  List<int>? secure_sales;

  @JsonKey(name: "group_goals")
  List<int>? group_goals;

  @JsonKey(name: "bill_splitter")
  List<int>? bill_splitter;

  @JsonKey(name: "bets_wager")
  List<int>? bets_wager;

  TransactionStatisticsResponse();

  factory TransactionStatisticsResponse.fromJson(Map<String, dynamic> json) {
    return _$TransactionStatisticsResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionStatisticsResponseToJson(this);
  }
}


@JsonSerializable()
class TransactionResponseData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "status")
  String? transactionStatus;
  @JsonKey(name: "total_amount")
  double? total;
  @JsonKey(name: "percentage")
  double? percentage;
  @JsonKey(name: "payee")
  int? payee;
  @JsonKey(name: "created_at")
  DateTime? dateCreated;
  @JsonKey(name: "expires_at")
  DateTime? expiryDate;
  @JsonKey(name: "obligations")
  List<ObligationResponse>? obligations;
  @JsonKey(name: "users")
  List<UserDataResponse>? members;
  @JsonKey(name: "note")
  NoteResponse? note;
  @JsonKey(name: "mediation")
  MediationResponse? mediation;

  TransactionResponseData();

  factory TransactionResponseData.fromJson(Map<String, dynamic> json) {
    return _$TransactionResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TransactionResponseDataToJson(this);
  }
}

@JsonSerializable()
class ObligationResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "status")
  String? obligationStatus;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "binding")
  int? binding;
  @JsonKey(name: "expires_at")
  DateTime? expiresAt;
  @JsonKey(name: "token")
  ObligationTokenResponse? token;
  @JsonKey(name: "amount")
  ObligationAmountResponse? amount;
  @JsonKey(name: "details")
  ObligationDetailsResponse? details;

  ObligationResponse();

  factory ObligationResponse.fromJson(Map<String, dynamic> json) {
    return _$ObligationResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ObligationResponseToJson(this);
  }
}


@JsonSerializable()
class ObligationTokenResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "value")
  String? value;

  ObligationTokenResponse();

  factory ObligationTokenResponse.fromJson(Map<String, dynamic> json) {
    return _$ObligationTokenResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ObligationTokenResponseToJson(this);
  }
}

@JsonSerializable()
class ObligationAmountResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "amount")
  double? amount;

  ObligationAmountResponse();

  factory ObligationAmountResponse.fromJson(Map<String, dynamic> json) {
    return _$ObligationAmountResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ObligationAmountResponseToJson(this);
  }
}

@JsonSerializable()
class ObligationDetailsResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "details")
  String? details;

  ObligationDetailsResponse();

  factory ObligationDetailsResponse.fromJson(Map<String, dynamic> json) {
    return _$ObligationDetailsResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ObligationDetailsResponseToJson(this);
  }
}

@JsonSerializable()
class MediationResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  User? mediator;
  @JsonKey(name: "created_by")
  int? createdBy;
  @JsonKey(name: "binding")
  int? bindingTo;
  @JsonKey(name: "source_type")
  String? sourceType;
  @JsonKey(name: "details")
  String? details;
  @JsonKey(name: "web")
  String? web;
  @JsonKey(name: "video")
  String? video;
  @JsonKey(name: "image")
  String? image;

  MediationResponse();

  factory MediationResponse.fromJson(Map<String, dynamic> json) {
    return _$MediationResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$MediationResponseToJson(this);
  }
}

@JsonSerializable()
class NoteResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "details")
  String? transactions;

  NoteResponse();

  factory NoteResponse.fromJson(Map<String, dynamic> json) {
    return _$NoteResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$NoteResponseToJson(this);
  }
}


@JsonSerializable()
class NotificationResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user")
  UserResponse? user;
  @JsonKey(name: "transaction")
  TransactionResponse? transaction;
  @JsonKey(name: "state")
  String? notificationState;

  NotificationResponse();

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return _$NotificationResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationResponseToJson(this);
  }
}

