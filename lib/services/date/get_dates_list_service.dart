import 'package:daily_fans/models/date/date_model.dart';
import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:get/get.dart';
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
  List<DateModel>? data;

  GetDatesListResponse(this.data) : super('', 0);

  Map<String, dynamic> toJson() => _$GetDatesListResponseToJson(this);

  factory GetDatesListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDatesListResponseFromJson(json);
}

Future<GetDatesListResponse?> getDatesListService(String sortType) async {
  var controller = Get.find<DatesController>();
  controller.toggleLoading(DatesLoadings.getDates, true);
  var service = ServiceHelper(
      url: "/PriceList/getAll/$sortType",
      methodEnum: HttpMethodEnum.GET,
      loaderType: LoaderType.Action,
      microService: MicroServiceEnum.AAA);
  await service.call();
  controller.toggleLoading(DatesLoadings.getDates, false);
  if (service.response == null) {
    return null;
  } else {
    return GetDatesListResponse.fromJson(service.response!.data!);
  }
}
