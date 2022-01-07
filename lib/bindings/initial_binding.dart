import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UtilController());
    _checkAuth();
  }

  void _checkAuth() {
    var utils = Get.find<UtilController>();
    utils.checkAuth();
  }
}
