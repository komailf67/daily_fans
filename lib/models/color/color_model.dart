import 'package:json_annotation/json_annotation.dart';

part 'color_model.g.dart';

@JsonSerializable()
class ColorType {
  int id;
  String title;
  String hex;
  ColorType({
    required this.id,
    required this.title,
    required this.hex,
  });

  Map<String, dynamic> toJson() => _$ColorTypeToJson(this);

  factory ColorType.fromJson(Map<String, dynamic> json) =>
      _$ColorTypeFromJson(json);
}
