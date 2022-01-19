// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadingDateModel _$LoadingDateModelFromJson(Map<String, dynamic> json) =>
    LoadingDateModel(
      loading: json['loading'] as bool,
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: json['dateTime'],
      userId: json['userId'],
    )..row = json['row'] as int?;

Map<String, dynamic> _$LoadingDateModelToJson(LoadingDateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dateTime': instance.dateTime,
      'userId': instance.userId,
      'row': instance.row,
      'loading': instance.loading,
    };
