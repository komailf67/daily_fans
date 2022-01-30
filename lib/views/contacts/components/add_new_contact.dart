import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/views/contacts/contacts_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class AddNewContact extends GetView<ContactsController> {
  const AddNewContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showContactsModal() {
      controller.getContacts();
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Obx(
              () => Container(
                height: controller.contacts.isNotEmpty
                    ? MediaQuery.of(context).size.height * .7
                    : MediaQuery.of(context).size.height * .3,
                color: const Color(0xFF737373),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: controller.contacts == null
                      ? ListView.builder(
                          itemCount: controller.contacts.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            Contact? contact =
                                controller.contacts.elementAt(index);
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 18),
                              leading: (contact.avatar != null &&
                                      contact.avatar!.isNotEmpty)
                                  ? CircleAvatar(
                                      backgroundImage:
                                          MemoryImage(contact.avatar!),
                                    )
                                  : CircleAvatar(
                                      child: Text(contact.initials()),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              title: Text(contact.displayName ?? ''),
                              // onPressed().
                            );
                          },
                        )
                      : Center(child: const CircularProgressIndicator()),
                ),
              ),
            );
          });
    }

    return SizedBox(
      child: FloatingActionButton(
        onPressed: () => showContactsModal(),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
