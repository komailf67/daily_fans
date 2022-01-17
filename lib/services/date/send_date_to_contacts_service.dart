import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_date_to_contacts_service.g.dart';

@JsonSerializable()
class SendDatesToContactRequest {
  int priceListId;

  SendDatesToContactRequest({required this.priceListId});

  Map<String, dynamic> toJson() => _$SendDatesToContactRequestToJson(this);

  factory SendDatesToContactRequest.fromJson(Map<String, dynamic> json) =>
      _$SendDatesToContactRequestFromJson(json);
}

@JsonSerializable()
class SendDatesToContactResponse extends MainResponse {
  SendDatesToContactResponse() : super('', 0);

  Map<String, dynamic> toJson() => _$SendDatesToContactResponseToJson(this);

  factory SendDatesToContactResponse.fromJson(Map<String, dynamic> json) =>
      _$SendDatesToContactResponseFromJson(json);
}

Future<SendDatesToContactResponse?> sendDatesToContactsService(
    SendDatesToContactRequest request) async {
  var service = ServiceHelper(
      url: "/PriceList/sendMessage?priceListId=${request.priceListId}",
      methodEnum: HttpMethodEnum.POST,
      loaderType: LoaderType.Action,
      // request: request.toJson(),
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return SendDatesToContactResponse.fromJson(service.response!.data!);
}
