import 'package:json_annotation/json_annotation.dart';

part 'main_response_model.g.dart';

@JsonSerializable()
class MainResponse {
  String? message;
  int? code;

  MainResponse(this.message, this.code);

  Map<String, dynamic> toJson() => _$MainResponseToJson(this);

  factory MainResponse.fromJson(Map<String, dynamic> json) =>
      _$MainResponseFromJson(json);
}
