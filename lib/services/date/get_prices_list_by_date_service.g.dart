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
      (json['data'] as List<dynamic>?)
          ?.map((e) => PriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..message = json['message'] as String?
      ..code = json['code'] as int?;

Map<String, dynamic> _$GetPricesListByDateServiceResponseToJson(
        GetPricesListByDateServiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
