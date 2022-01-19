import 'package:daily_fans/models/date/date_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'loading_date_model.g.dart';

@JsonSerializable()
class LoadingDateModel extends DateModel {
  bool loading;

  LoadingDateModel(
      {required this.loading, id, title, description, dateTime, userId})
      : super(
          id: id,
          title: title,
          description: description,
          dateTime: dateTime,
          userId: userId,
        );

  Map<String, dynamic> toJson() => _$LoadingDateModelToJson(this);

  factory LoadingDateModel.fromJson(Map<String, dynamic> json) =>
      _$LoadingDateModelFromJson(json);
}
