import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  int? userType;
  String? token;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.userType,
    this.token,
  });

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
