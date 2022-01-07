// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenModel _$RefreshTokenModelFromJson(Map<String, dynamic> json) =>
    RefreshTokenModel(
      id: json['id'] as int,
      token: json['token'] as String,
      expirationDate: DateTime.parse(json['expirationDate'] as String),
    );

Map<String, dynamic> _$RefreshTokenModelToJson(RefreshTokenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'expirationDate': instance.expirationDate.toIso8601String(),
    };
