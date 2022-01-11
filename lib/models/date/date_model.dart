import 'package:json_annotation/json_annotation.dart';

part 'date_model.g.dart';

@JsonSerializable()
class DateModel {
  int? id;
  String? title;
  String? description;
  String? dateTime;
  int? userId;
  int? row;

  DateModel({
    this.id,
    this.title,
    this.description,
    this.dateTime,
    this.userId,
    this.row,
  });

  Map<String, dynamic> toJson() => _$DateModelToJson(this);

  factory DateModel.fromJson(Map<String, dynamic> json) =>
      _$DateModelFromJson(json);
}
