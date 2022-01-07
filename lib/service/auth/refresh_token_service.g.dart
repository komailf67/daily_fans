// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenServiceRequest _$RefreshTokenServiceRequestFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenServiceRequest(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshTokenServiceRequestToJson(
        RefreshTokenServiceRequest instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

RefreshTokenServiceResponse _$RefreshTokenServiceResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenServiceResponse(
      refreshToken: RefreshTokenModel.fromJson(
          json['refreshToken'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$RefreshTokenServiceResponseToJson(
        RefreshTokenServiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'accessToken': instance.accessToken,
    };
