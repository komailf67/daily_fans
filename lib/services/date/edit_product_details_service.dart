import 'package:daily_fans/models/main_response_model.dart';
import 'package:daily_fans/utils/base_url.dart';
import 'package:daily_fans/utils/service_helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_product_details_service.g.dart';

@JsonSerializable()
class EditProductDetailsRequest {
  int id;
  String title;
  String description;
  int price;
  String partNumber;
  int yearModel;
  int colorId;
  bool hasGuarantee;
  int priceListId;

  EditProductDetailsRequest(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.partNumber,
      required this.yearModel,
      required this.colorId,
      required this.hasGuarantee,
      required this.priceListId});

  Map<String, dynamic> toJson() => _$EditProductDetailsRequestToJson(this);

  factory EditProductDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProductDetailsRequestFromJson(json);
}

@JsonSerializable()
class EditProductDetailsResponse extends MainResponse {
  EditProductDetailsResponse() : super();

  Map<String, dynamic> toJson() => _$EditProductDetailsResponseToJson(this);

  factory EditProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProductDetailsResponseFromJson(json);
}

Future<EditProductDetailsResponse?> editProductDetailsService(
    EditProductDetailsRequest request) async {
  var service = ServiceHelper(
      url: "/PriceListD/update",
      methodEnum: HttpMethodEnum.PUT,
      loaderType: LoaderType.Action,
      request: request.toJson(),
      microService: MicroServiceEnum.AAA);
  await service.call();
  if (service.response == null) return null;
  return EditProductDetailsResponse.fromJson(service.response!.data!);
}
