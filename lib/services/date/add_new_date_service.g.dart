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
    AddNewDateResponse()
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$AddNewDateResponseToJson(AddNewDateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
    };
