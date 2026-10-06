import 'package:json_annotation/json_annotation.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';

part 'responses.g.dart';

@JsonSerializable()
class DepositInitiateResponse extends BaseResponse {
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "tx_ref")
  String? txRef;
  @JsonKey(name: "payment_id")
  int? paymentId;
  @JsonKey(name: "status")
  String? paymentStatus;

  DepositInitiateResponse();

  factory DepositInitiateResponse.fromJson(Map<String, dynamic> json) {
    return _$DepositInitiateResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$DepositInitiateResponseToJson(this);
  }
}

@JsonSerializable()
class PaymentStatusResponse extends BaseResponse {
  @JsonKey(name: "status")
  String? paymentStatus;
  @JsonKey(name: "amount")
  double? amount;
  @JsonKey(name: "currency")
  String? currency;
  @JsonKey(name: "channel")
  String? channel;

  PaymentStatusResponse();

  factory PaymentStatusResponse.fromJson(Map<String, dynamic> json) {
    return _$PaymentStatusResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentStatusResponseToJson(this);
  }
}

@JsonSerializable()
class AccountsResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<AccountResponse>? accounts;

  AccountsResponse();

  factory AccountsResponse.fromJson(Map<String, dynamic> json) {
    return _$AccountsResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AccountsResponseToJson(this);
  }
}
