// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_date_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewDateRequest _$AddNewDateRequestFromJson(Map<String, dynamic> json) =>
    AddNewDateRequest(
      title: json['title'] as String,
      dateTime: json['dateTime'] as String,
    );

Map<String, dynamic> _$AddNewDateRequestToJson(AddNewDateRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'dateTime': instance.dateTime,
    };

AddNewDateResponse _$AddNewDateResponseFromJson(Map<String, dynamic> json) =>
    AddNewDateResponse(
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

Map<String, dynamic> _$AddNewDateResponseToJson(AddNewDateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'otpToken': instance.otpToken,
    };
