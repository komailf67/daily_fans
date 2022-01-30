import 'package:get/get.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsController extends GetxController {
  @override
  void onReady() {
    // getContacts();
    // getColors();
  }

  RxList<Contact> contacts = <Contact>[].obs;

  Future<void> getContacts() async {
    contacts.clear();
    final Iterable<Contact> phoneContacts = await ContactsService.getContacts();
    for (var item in phoneContacts) {
      contacts.add(item);
    }
  }
}
