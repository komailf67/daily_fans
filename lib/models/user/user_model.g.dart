// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      phone: json['phone'] as String?,
      isTwoStepVerificationEnabled:
          json['isTwoStepVerificationEnabled'] as bool,
      isPhoneRegistered: json['isPhoneRegistered'] as bool,
      isBlocked: json['isBlocked'] as bool,
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'isTwoStepVerificationEnabled': instance.isTwoStepVerificationEnabled,
      'isPhoneRegistered': instance.isPhoneRegistered,
      'isBlocked': instance.isBlocked,
      'username': instance.username,
    };
