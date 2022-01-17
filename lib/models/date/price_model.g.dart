// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) => PriceModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      partNumber: json['partNumber'] as String?,
      yearModel: json['yearModel'] as int?,
      colorId: json['colorId'] as int?,
      color: json['color'] == null
          ? null
          : ColorType.fromJson(json['color'] as Map<String, dynamic>),
      hasGuarantee: json['hasGuarantee'] as bool?,
      priceListId: json['priceListId'] as int?,
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'partNumber': instance.partNumber,
      'yearModel': instance.yearModel,
      'colorId': instance.colorId,
      'color': instance.color,
      'hasGuarantee': instance.hasGuarantee,
      'priceListId': instance.priceListId,
    };
