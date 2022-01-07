// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginServiceRequest _$LoginServiceRequestFromJson(Map<String, dynamic> json) =>
    LoginServiceRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginServiceRequestToJson(
        LoginServiceRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

LoginServiceResponse _$LoginServiceResponseFromJson(
        Map<String, dynamic> json) =>
    LoginServiceResponse(
      json['accessToken'] as String?,
      json['refreshToken'] == null
          ? null
          : RefreshTokenModel.fromJson(
              json['refreshToken'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      json['otpToken'] == null
          ? null
          : OtpTokenModel.fromJson(json['otpToken'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$LoginServiceResponseToJson(
        LoginServiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'otpToken': instance.otpToken,
    };
