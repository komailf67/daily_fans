import 'package:daily_fans/enums/auth_enum.dart';
import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/theme/theme_constants.dart';
import 'package:daily_fans/utils/storage.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import '../main.dart';
import 'base_url.dart';

const String DefaultErrorMessage = "Something went wrong! please try again";
const String DefaultErrorTitle = "Error";

enum HttpMethodEnum { POST, GET, PUT, DELETE }

enum LoaderType { None, Action, Skeleton }

const AccessTokenStorageTag = "access_token";

class ServiceHelper {
  final String url;
  final Map<String, dynamic>? request;
  final HttpMethodEnum methodEnum;
  final LoaderType loaderType;
  final String baseUrl;
  final Dio.Dio _dio = Dio.Dio();
  final bool showAlert;
  Dio.Response<Map<String, dynamic>>? response;

  ServiceHelper({
    required this.url,
    this.request,
    required this.methodEnum,
    required this.loaderType,
    required MicroServiceEnum microService,
    bool? showAlert,
  })  : baseUrl = BaseUrl.get(microService),
        this.showAlert = showAlert ?? true;

  Future call() async {
    _addLoader(methodEnum);
    try {
      var options = await _getOptions();
      switch (methodEnum) {
        case HttpMethodEnum.GET:
          response = await _dio.get<Map<String, dynamic>>(baseUrl + url,
              options: options);
          break;
        case HttpMethodEnum.POST:
          response = await _dio.post<Map<String, dynamic>>(baseUrl + url,
              data: request, options: options);
          break;
        case HttpMethodEnum.PUT:
          response = await _dio.put<Map<String, dynamic>>(baseUrl + url,
              data: request, options: options);
          break;
        case HttpMethodEnum.DELETE:
          response = await _dio.delete<Map<String, dynamic>>(baseUrl + url,
              options: options);
          break;
      }
    } on Dio.DioError catch (e) {
      _handleError(e);
    }
    _logRequest();
    _removeLoader();
  }

  void _logRequest() {
    logger.d({
      "url": baseUrl + url,
      "requestBody": request,
      "responseBody": response?.data,
      "responseHeader": response?.headers
    });
  }

  void _handleError(Dio.DioError error) {
    _logError(error);
    if (!showAlert) return;
    _checkForUnhandledError(error);
    _checkForJsonSerializedError(error);
    _checkErrorForAuthentication(error);
  }

  void _logError(Dio.DioError error) {
    logger.e(error);
    logger.d({
      "url": url,
      "error": error.error,
      "request": request,
      "responseBody": error.response,
      "responseHeader": error.response?.headers,
    });
  }

  static void _checkForJsonSerializedError(Dio.DioError error) {
    if (!(error.response?.data is Map<String, dynamic>)) return;
    var data = error.response?.data as Map<String, dynamic>;
    _showHandledError(data);
  }

  static void _showHandledError(Map<String, dynamic> data) {
    data.putIfAbsent("clientMessage", () => DefaultErrorMessage);
    data.putIfAbsent("code", () => -1);
    Get.snackbar(
      DefaultErrorTitle,
      "${data["clientMessage"]} (${data["code"]})",
      backgroundColor: errorColor,
    );
  }

  static void _checkForUnhandledError(Dio.DioError error) {
    if (error.response?.data == null ||
        error.response?.data is! Map<String, dynamic>) {
      Get.snackbar(
        DefaultErrorTitle,
        DefaultErrorMessage,
        backgroundColor: errorColor,
      );
    }
  }

  static void _checkErrorForAuthentication(Dio.DioError error) {
    var util = _getController();
    if (util.authStatus.value != AuthEnum.Authorized) return;
    if (error.response?.statusCode != 401) return;
    util.authStatus.value = AuthEnum.NotAuthorized;
  }

  void _addLoader(methodEnum) {
    if (loaderType == LoaderType.None) return;
    var util = _getController();
    if (methodEnum == HttpMethodEnum.POST) {
      util.toggleSkeletonLoadingState(true);
    }
    if (loaderType == LoaderType.Action) util.actionLoader.add(url);
    if (loaderType == LoaderType.Skeleton) util.skeletonLoader.add(url);
  }

  void _removeLoader() {
    if (loaderType == LoaderType.None) return;
    var util = _getController();
    util.toggleSkeletonLoadingState(false);
    if (loaderType == LoaderType.Action) util.actionLoader.remove(url);
    if (loaderType == LoaderType.Skeleton) util.skeletonLoader.remove(url);
  }

  static UtilController _getController() {
    var controller = Get.find<UtilController>();
    return controller;
  }

  static Future<Dio.Options> _getOptions() async {
    var token = await _getToken();
    var options = Dio.Options(
      contentType: Dio.Headers.jsonContentType,
      headers: {"Authorization": token ?? ""},
    );
    return options;
  }

  static Future<String?> _getToken() async {
    var storage = Storage();
    var token = await storage.getElement(AccessTokenStorageTag);
    return token;
  }
}
