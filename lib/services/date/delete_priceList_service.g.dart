// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_priceList_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletePriceListRequest _$DeletePriceListRequestFromJson(
        Map<String, dynamic> json) =>
    DeletePriceListRequest(
      priceListId: json['priceListId'] as int,
    );

Map<String, dynamic> _$DeletePriceListRequestToJson(
        DeletePriceListRequest instance) =>
    <String, dynamic>{
      'priceListId': instance.priceListId,
    };

DeletePriceListResponse _$DeletePriceListResponseFromJson(
        Map<String, dynamic> json) =>
    DeletePriceListResponse()
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$DeletePriceListResponseToJson(
        DeletePriceListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
    };
