// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_date_to_contacts_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendDatesToContactRequest _$SendDatesToContactRequestFromJson(
        Map<String, dynamic> json) =>
    SendDatesToContactRequest(
      priceListId: json['priceListId'] as int,
    );

Map<String, dynamic> _$SendDatesToContactRequestToJson(
        SendDatesToContactRequest instance) =>
    <String, dynamic>{
      'priceListId': instance.priceListId,
    };

SendDatesToContactResponse _$SendDatesToContactResponseFromJson(
        Map<String, dynamic> json) =>
    SendDatesToContactResponse()
      ..message = json['message'] as String?
      ..success = json['success'] as bool?
      ..error = json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>);

Map<String, dynamic> _$SendDatesToContactResponseToJson(
        SendDatesToContactResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
    };
