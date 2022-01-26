import 'package:daily_fans/models/date/price_model.dart';
import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_prices_list_by_date_service.g.dart';

@JsonSerializable()
class GetPricesListByDateServiceRequest {
  int dateId;

  GetPricesListByDateServiceRequest({required this.dateId});

  Map<String, dynamic> toJson() =>
      _$GetPricesListByDateServiceRequestToJson(this);

  factory GetPricesListByDateServiceRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetPricesListByDateServiceRequestFromJson(json);
}

@JsonSerializable()
class GetPricesListByDateServiceResponse extends MainResponse {
  List<PriceModel>? data;

  GetPricesListByDateServiceResponse({this.data}) : super();

  Map<String, dynamic> toJson() =>
      _$GetPricesListByDateServiceResponseToJson(this);

  factory GetPricesListByDateServiceResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetPricesListByDateServiceResponseFromJson(json);
}

Future<GetPricesListByDateServiceResponse?> getPricesListByDateService(
    int dateId) async {
  var controller = Get.find<DatesController>();
  controller.toggleLoading(DatesLoadings.getPrices, true);
  var service = ServiceHelper(
      url: "/PriceListD/getByPriceListId/$dateId",
      methodEnum: HttpMethodEnum.GET,
      loaderType: LoaderType.Action,
      microService: MicroServiceEnum.AAA);
  await service.call();
  controller.toggleLoading(DatesLoadings.getPrices, false);
  if (service.response == null) return null;
  return GetPricesListByDateServiceResponse.fromJson(service.response!.data!);
}
