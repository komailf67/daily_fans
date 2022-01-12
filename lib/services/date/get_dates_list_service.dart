import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_dates_list_service.g.dart';

@JsonSerializable()
class GetDatesListRequest {
  GetDatesListRequest();

  Map<String, dynamic> toJson() => _$GetDatesListRequestToJson(this);

  factory GetDatesListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetDatesListRequestFromJson(json);
}

@JsonSerializable()
class GetDatesListResponse extends MainResponse {
  List<Map<String, dynamic>>? data; //TODO note

  GetDatesListResponse(this.data) : super('', 0);

  Map<String, dynamic> toJson() => _$GetDatesListResponseToJson(this);

  factory GetDatesListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDatesListResponseFromJson(json);
}

Future<GetDatesListResponse?> getDatesListService(String sortType) async {
  var service = ServiceHelper(
      url: "/PriceList/getAll$sortType",
      methodEnum: HttpMethodEnum.GET,
      loaderType: LoaderType.Action,
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return GetDatesListResponse.fromJson(service.response!.data!);
}
