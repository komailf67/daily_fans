import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_date_service.g.dart';

@JsonSerializable()
class DeleteDateRequest {
  int dateId;
  DeleteDateRequest({required this.dateId});

  Map<String, dynamic> toJson() => _$DeleteDateRequestToJson(this);

  factory DeleteDateRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteDateRequestFromJson(json);
}

@JsonSerializable()
class DeleteDateResponse extends MainResponse {
  DeleteDateResponse() : super('', 0);

  Map<String, dynamic> toJson() => _$DeleteDateResponseToJson(this);

  factory DeleteDateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteDateResponseFromJson(json);
}

Future<DeleteDateResponse?> deleteDateService(DeleteDateRequest request) async {
  var service = ServiceHelper(
      url: "/PriceList/${request.dateId}",
      methodEnum: HttpMethodEnum.DELETE,
      loaderType: LoaderType.Action,
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return DeleteDateResponse.fromJson(service.response!.data!);
}
