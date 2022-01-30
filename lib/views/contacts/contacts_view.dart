import 'package:daily_fans/views/contacts/components/add_new_contact.dart';
import 'package:daily_fans/views/contacts/contacts_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({Key? key}) : super(key: key);
  static String route() => '/contacts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: controller.contacts.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              Contact? contact = controller.contacts.elementAt(index);
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                leading: (contact.avatar != null && contact.avatar!.isNotEmpty)
                    ? CircleAvatar(
                        backgroundImage: MemoryImage(contact.avatar!),
                      )
                    : CircleAvatar(
                        child: Text(contact.initials()),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                title: Text(contact.displayName ?? ''),
                // onPressed().
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const AddNewContact(),
    );
  }
}
