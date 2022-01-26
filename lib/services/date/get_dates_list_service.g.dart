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
    GetDatesListResponse()
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>)
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => DateModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetDatesListResponseToJson(
        GetDatesListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };
