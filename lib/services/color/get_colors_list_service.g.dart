// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_colors_list_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetColorsListRequest _$GetColorsListRequestFromJson(
        Map<String, dynamic> json) =>
    GetColorsListRequest();

Map<String, dynamic> _$GetColorsListRequestToJson(
        GetColorsListRequest instance) =>
    <String, dynamic>{};

GetColorsListResponse _$GetColorsListResponseFromJson(
        Map<String, dynamic> json) =>
    GetColorsListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ColorType.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$GetColorsListResponseToJson(
        GetColorsListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };
