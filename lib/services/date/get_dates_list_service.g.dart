// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dates_list_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDatesListRequest _$GetDatesListRequestFromJson(Map<String, dynamic> json) =>
    GetDatesListRequest();

Map<String, dynamic> _$GetDatesListRequestToJson(
        GetDatesListRequest instance) =>
    <String, dynamic>{};

GetDatesListResponse _$GetDatesListResponseFromJson(
        Map<String, dynamic> json) =>
    GetDatesListResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$GetDatesListResponseToJson(
        GetDatesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
