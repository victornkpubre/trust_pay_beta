import 'package:json_annotation/json_annotation.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';

part 'responses.g.dart';

@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: "token")
  String? token; 
  @JsonKey(name: "user")
  UserDataResponse? user;

  AuthResponse(this.token, this.user);
  
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }
}