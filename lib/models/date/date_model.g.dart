// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateModel _$DateModelFromJson(Map<String, dynamic> json) => DateModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      dateTime: json['dateTime'] as String?,
      userId: json['userId'] as int?,
      row: json['row'] as int?,
    );

Map<String, dynamic> _$DateModelToJson(DateModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dateTime': instance.dateTime,
      'userId': instance.userId,
      'row': instance.row,
    };
