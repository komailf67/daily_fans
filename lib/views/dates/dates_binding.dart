import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:get/get.dart';

class DatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.delete<DatesController>();
    Get.lazyPut(() => DatesController());
  }
}
