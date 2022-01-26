// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_product_details_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProductDetailsRequest _$EditProductDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    EditProductDetailsRequest(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      partNumber: json['partNumber'] as String,
      yearModel: json['yearModel'] as int,
      colorId: json['colorId'] as int,
      hasGuarantee: json['hasGuarantee'] as bool,
      priceListId: json['priceListId'] as int,
    );

Map<String, dynamic> _$EditProductDetailsRequestToJson(
        EditProductDetailsRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'partNumber': instance.partNumber,
      'yearModel': instance.yearModel,
      'colorId': instance.colorId,
      'hasGuarantee': instance.hasGuarantee,
      'priceListId': instance.priceListId,
    };

EditProductDetailsResponse _$EditProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    EditProductDetailsResponse()
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$EditProductDetailsResponseToJson(
        EditProductDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
    };
