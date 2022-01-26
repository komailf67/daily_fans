import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_new_date_service.g.dart';

@JsonSerializable()
class AddNewDateRequest {
  String title;
  String dateTime;

  AddNewDateRequest({required this.title, required this.dateTime});

  Map<String, dynamic> toJson() => _$AddNewDateRequestToJson(this);

  factory AddNewDateRequest.fromJson(Map<String, dynamic> json) =>
      _$AddNewDateRequestFromJson(json);
}

@JsonSerializable()
class AddNewDateResponse extends MainResponse {
  AddNewDateResponse() : super();

  Map<String, dynamic> toJson() => _$AddNewDateResponseToJson(this);

  factory AddNewDateResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNewDateResponseFromJson(json);
}

Future<AddNewDateResponse?> addNewDateService(AddNewDateRequest request) async {
  // HttpOverrides.global = MyHttpOverrides();
  var service = ServiceHelper(
      url: "/PriceList/Create",
      methodEnum: HttpMethodEnum.POST,
      loaderType: LoaderType.Action,
      request: request.toJson(),
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return AddNewDateResponse.fromJson(service.response!.data!);
}
