import 'package:get/get.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.delete<LoginController>();
    Get.lazyPut(() => LoginController());
  }
}
