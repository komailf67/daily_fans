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
      UserModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$LoginServiceResponseToJson(
        LoginServiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
