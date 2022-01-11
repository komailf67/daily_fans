import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/models/refreshToken/refresh_token_model.dart';
import 'package:daily_fans/models/user/user_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_service.g.dart';

@JsonSerializable()
class RefreshTokenServiceRequest {
  final String refreshToken;

  RefreshTokenServiceRequest({required this.refreshToken});

  Map<String, dynamic> toJson() => _$RefreshTokenServiceRequestToJson(this);

  factory RefreshTokenServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenServiceRequestFromJson(json);
}

@JsonSerializable()
class RefreshTokenServiceResponse extends MainResponse {
  final RefreshTokenModel refreshToken;
  final UserModel user;
  final String accessToken;

  RefreshTokenServiceResponse({
    required this.refreshToken,
    required this.user,
    required this.accessToken,
  }) : super('', 0);

  Map<String, dynamic> toJson() => _$RefreshTokenServiceResponseToJson(this);

  factory RefreshTokenServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenServiceResponseFromJson(json);
}

Future<RefreshTokenServiceResponse?> refreshTokenService(
    RefreshTokenServiceRequest request) async {
  var service = ServiceHelper(
      url: "/authorization/refresh",
      methodEnum: HttpMethodEnum.POST,
      loaderType: LoaderType.Skeleton,
      request: request.toJson(),
      microService: MicroServiceEnum.AAA,
      showAlert: false);
  await service.call();
  if (service.response == null) return null;
  return RefreshTokenServiceResponse.fromJson(service.response!.data!);
}
