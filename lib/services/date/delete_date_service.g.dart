// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_date_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteDateRequest _$DeleteDateRequestFromJson(Map<String, dynamic> json) =>
    DeleteDateRequest(
      dateId: json['dateId'] as int,
    );

Map<String, dynamic> _$DeleteDateRequestToJson(DeleteDateRequest instance) =>
    <String, dynamic>{
      'dateId': instance.dateId,
    };

DeleteDateResponse _$DeleteDateResponseFromJson(Map<String, dynamic> json) =>
    DeleteDateResponse()
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$DeleteDateResponseToJson(DeleteDateResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
