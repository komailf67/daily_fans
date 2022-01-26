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
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$LoginServiceResponseToJson(
        LoginServiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };
