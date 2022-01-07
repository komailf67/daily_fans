// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpTokenModel _$OtpTokenModelFromJson(Map<String, dynamic> json) =>
    OtpTokenModel(
      id: json['id'] as int,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      retries: json['retries'] as int,
      isUsed: json['isUsed'] as bool,
    );

Map<String, dynamic> _$OtpTokenModelToJson(OtpTokenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'retries': instance.retries,
      'isUsed': instance.isUsed,
    };
