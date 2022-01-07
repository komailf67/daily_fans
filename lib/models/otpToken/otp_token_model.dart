import 'package:json_annotation/json_annotation.dart';

part 'otp_token_model.g.dart';

@JsonSerializable()
class OtpTokenModel {
  int id;
  DateTime expirationDate;
  int retries;
  bool isUsed;

  OtpTokenModel({
    required this.id,
    required this.expirationDate,
    required this.retries,
    required this.isUsed,
  });

  Map<String, dynamic> toJson() => _$OtpTokenModelToJson(this);

  factory OtpTokenModel.fromJson(Map<String, dynamic> json) =>
      _$OtpTokenModelFromJson(json);
}
