import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/models/user/user_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_service.g.dart';

@JsonSerializable()
class LoginServiceRequest {
  String username;
  String password;

  LoginServiceRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() => _$LoginServiceRequestToJson(this);

  factory LoginServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginServiceRequestFromJson(json);
}

@JsonSerializable()
class LoginServiceResponse extends MainResponse {
  UserModel? data;

  LoginServiceResponse({this.data}) : super();

  Map<String, dynamic> toJson() => _$LoginServiceResponseToJson(this);

  factory LoginServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginServiceResponseFromJson(json);
}

Future<LoginServiceResponse?> loginService(LoginServiceRequest request) async {
  // HttpOverrides.global = MyHttpOverrides();
  var service = ServiceHelper(
      url: "/Users/authenticate",
      methodEnum: HttpMethodEnum.POST,
      loaderType: LoaderType.Action,
      request: request.toJson(),
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return LoginServiceResponse.fromJson(service.response!.data!);
}
