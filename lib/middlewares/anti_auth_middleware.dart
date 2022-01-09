import 'package:daily_fans/enums/auth_enum.dart';
import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/views/dates/dates_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AntiAuthMiddleWare extends GetMiddleware {
  @override
  int? get priority => -1;

  @override
  RouteSettings? redirect(String? route) {
    var utils = Get.find<UtilController>();
    if (utils.authStatus.value == AuthEnum.Authorized) {
      return RouteSettings(name: DatesView.route());
    }
    utils.authStatus.listen((status) {
      if (status == AuthEnum.Authorized) {
        Get.offAllNamed(DatesView.route());
      }
    });
    return super.redirect(route);
  }
}
