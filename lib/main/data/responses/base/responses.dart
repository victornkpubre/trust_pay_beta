import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "statusCode")
  int? status;
  @JsonKey(name: "message")
  String? message;

  BaseResponse({
    this.status,
    this.message,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BaseResponseToJson(this);
  }
}
