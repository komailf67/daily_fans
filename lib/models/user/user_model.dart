import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String? phone;
  bool isTwoStepVerificationEnabled;
  bool isPhoneRegistered;
  bool isBlocked;
  String username;

  UserModel({
    required this.id,
    this.phone,
    required this.isTwoStepVerificationEnabled,
    required this.isPhoneRegistered,
    required this.isBlocked,
    required this.username,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
