import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_model.g.dart';

@JsonSerializable()
class RefreshTokenModel {
  int id;
  String token;
  DateTime expirationDate;

  RefreshTokenModel({
    required this.id,
    required this.token,
    required this.expirationDate,
  });

  Map<String, dynamic> toJson() => _$RefreshTokenModelToJson(this);

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenModelFromJson(json);
}
