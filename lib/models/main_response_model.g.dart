// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponse _$MainResponseFromJson(Map<String, dynamic> json) => MainResponse(
      message: json['message'] as String?,
      success: json['success'] as bool?,
      error: json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainResponseToJson(MainResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
    };

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      code: json['code'] as int?,
      data: json['data'],
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
