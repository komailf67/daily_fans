// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_prices_list_by_date_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPricesListByDateServiceRequest _$GetPricesListByDateServiceRequestFromJson(
        Map<String, dynamic> json) =>
    GetPricesListByDateServiceRequest(
      dateId: json['dateId'] as int,
    );

Map<String, dynamic> _$GetPricesListByDateServiceRequestToJson(
        GetPricesListByDateServiceRequest instance) =>
    <String, dynamic>{
      'dateId': instance.dateId,
    };

GetPricesListByDateServiceResponse _$GetPricesListByDateServiceResponseFromJson(
        Map<String, dynamic> json) =>
    GetPricesListByDateServiceResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$GetPricesListByDateServiceResponseToJson(
        GetPricesListByDateServiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };
