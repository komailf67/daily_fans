import 'package:daily_fans/enums/auth_enum.dart';
import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/views/login/login_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => -1;

  @override
  RouteSettings? redirect(String? route) {
    var utils = Get.find<UtilController>();
    if (utils.authStatus.value == AuthEnum.NotAuthorized) {
      return RouteSettings(name: LoginView.route());
    }
    utils.authStatus.listen((status) {
      if (status == AuthEnum.NotAuthorized) {
        Get.offAllNamed(LoginView.route());
      }
    });
    return super.redirect(route);
  }
}
