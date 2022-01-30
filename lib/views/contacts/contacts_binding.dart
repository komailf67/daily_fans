import 'package:daily_fans/views/contacts/contacts_controller.dart';
import 'package:get/get.dart';

class ContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactsController());
  }
}
