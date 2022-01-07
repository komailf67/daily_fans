import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/models/otpToken/otp_token_model.dart';
import 'package:daily_fans/models/refreshToken/refresh_token_model.dart';
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
  String? accessToken;
  RefreshTokenModel? refreshToken;
  UserModel? user;
  OtpTokenModel? otpToken;

  LoginServiceResponse(
      this.accessToken, this.refreshToken, this.user, this.otpToken)
      : super('', 0);

  Map<String, dynamic> toJson() => _$LoginServiceResponseToJson(this);

  factory LoginServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginServiceResponseFromJson(json);
}

Future<LoginServiceResponse?> loginService(LoginServiceRequest request) async {
  var service = ServiceHelper(
      url: "/authorization/login",
      methodEnum: HttpMethodEnum.POST,
      loaderType: LoaderType.Action,
      request: request.toJson(),
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return LoginServiceResponse.fromJson(service.response!.data!);
}
