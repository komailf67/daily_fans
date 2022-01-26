import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/models/otpToken/otp_token_model.dart';
import 'package:daily_fans/models/refreshToken/refresh_token_model.dart';
import 'package:daily_fans/models/user/user_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_new_product_details_service.g.dart';

@JsonSerializable()
class AddNewProductDetailsRequest {
  String title;
  String description;
  int price;
  String partNumber;
  String yearModel;
  dynamic colorId;
  bool hasGuarantee;
  int priceListId;

  AddNewProductDetailsRequest(
      {required this.title,
      required this.description,
      required this.price,
      required this.partNumber,
      required this.yearModel,
      required this.colorId,
      required this.hasGuarantee,
      required this.priceListId});

  Map<String, dynamic> toJson() => _$AddNewProductDetailsRequestToJson(this);

  factory AddNewProductDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$AddNewProductDetailsRequestFromJson(json);
}

@JsonSerializable()
class AddNewProductDetailsResponse extends MainResponse {
  AddNewProductDetailsResponse() : super();

  Map<String, dynamic> toJson() => _$AddNewProductDetailsResponseToJson(this);

  factory AddNewProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNewProductDetailsResponseFromJson(json);
}

Future<AddNewProductDetailsResponse?> addNewProductDetailsService(
    AddNewProductDetailsRequest request) async {
  var service = ServiceHelper(
      url: "/PriceListD/create",
      methodEnum: HttpMethodEnum.POST,
      loaderType: LoaderType.Action,
      request: request.toJson(),
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return AddNewProductDetailsResponse.fromJson(service.response!.data!);
}
