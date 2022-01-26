import 'package:daily_fans/models/color/color_model.dart';
import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_colors_list_service.g.dart';

@JsonSerializable()
class GetColorsListRequest {
  GetColorsListRequest();

  Map<String, dynamic> toJson() => _$GetColorsListRequestToJson(this);

  factory GetColorsListRequest.fromJson(Map<String, dynamic> json) =>
      _$GetColorsListRequestFromJson(json);
}

@JsonSerializable()
class GetColorsListResponse extends MainResponse {
  List<ColorType>? data; //TODO note

  GetColorsListResponse({this.data}) : super();

  Map<String, dynamic> toJson() => _$GetColorsListResponseToJson(this);

  factory GetColorsListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetColorsListResponseFromJson(json);
}

Future<GetColorsListResponse?> getColorsListService() async {
  var service = ServiceHelper(
      url: "/Color/getAll/asc",
      methodEnum: HttpMethodEnum.GET,
      loaderType: LoaderType.Action,
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return GetColorsListResponse.fromJson(service.response!.data!);
}
