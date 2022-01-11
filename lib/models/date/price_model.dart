import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  int? id;
  String? title;
  String? description;
  int? price;
  String? portNumber;
  String? yearModel;
  String? color;
  bool? hasGuarantee;
  int? priceListId;

  PriceModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.portNumber,
    this.yearModel,
    this.color,
    this.hasGuarantee,
    this.priceListId,
  });

  Map<String, dynamic> toJson() => _$PriceModelToJson(this);

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
}
