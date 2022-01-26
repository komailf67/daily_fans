import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_priceList_service.g.dart';

@JsonSerializable()
class DeletePriceListRequest {
  int priceListId;
  DeletePriceListRequest({required this.priceListId});

  Map<String, dynamic> toJson() => _$DeletePriceListRequestToJson(this);

  factory DeletePriceListRequest.fromJson(Map<String, dynamic> json) =>
      _$DeletePriceListRequestFromJson(json);
}

@JsonSerializable()
class DeletePriceListResponse extends MainResponse {
  DeletePriceListResponse() : super();

  Map<String, dynamic> toJson() => _$DeletePriceListResponseToJson(this);

  factory DeletePriceListResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePriceListResponseFromJson(json);
}

Future<DeletePriceListResponse?> deletePriceListService(
    DeletePriceListRequest request) async {
  var service = ServiceHelper(
      url: "/PriceListD/${request.priceListId}",
      methodEnum: HttpMethodEnum.DELETE,
      loaderType: LoaderType.Action,
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return DeletePriceListResponse.fromJson(service.response!.data!);
}
