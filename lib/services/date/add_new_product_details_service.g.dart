// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_product_details_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewProductDetailsRequest _$AddNewProductDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    AddNewProductDetailsRequest(
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      partNumber: json['partNumber'] as String,
      yearModel: json['yearModel'] as String,
      colorId: json['colorId'],
      hasGuarantee: json['hasGuarantee'] as bool,
      priceListId: json['priceListId'] as int,
    );

Map<String, dynamic> _$AddNewProductDetailsRequestToJson(
        AddNewProductDetailsRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'partNumber': instance.partNumber,
      'yearModel': instance.yearModel,
      'colorId': instance.colorId,
      'hasGuarantee': instance.hasGuarantee,
      'priceListId': instance.priceListId,
    };

AddNewProductDetailsResponse _$AddNewProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    AddNewProductDetailsResponse()
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$AddNewProductDetailsResponseToJson(
        AddNewProductDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
    };
