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
      portNumber: json['portNumber'] as String?,
      yearModel: json['yearModel'] as String?,
      color: json['color'] as String?,
      hasGuarantee: json['hasGuarantee'] as bool?,
      priceListId: json['priceListId'] as int?,
    );

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'portNumber': instance.portNumber,
      'yearModel': instance.yearModel,
      'color': instance.color,
      'hasGuarantee': instance.hasGuarantee,
      'priceListId': instance.priceListId,
    };
