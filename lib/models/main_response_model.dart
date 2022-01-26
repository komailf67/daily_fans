import 'package:json_annotation/json_annotation.dart';

part 'main_response_model.g.dart';

@JsonSerializable()
class MainResponse {
  String? message;
  bool? success;
  ErrorModel? error;
  MainResponse({
    this.message,
    this.success,
    this.error,
  });

  Map<String, dynamic> toJson() => _$MainResponseToJson(this);

  factory MainResponse.fromJson(Map<String, dynamic> json) =>
      _$MainResponseFromJson(json);
}

@JsonSerializable()
class ErrorModel {
  int? code;
  dynamic data;

  ErrorModel({this.code, this.data});
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
