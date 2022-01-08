import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddNewDate extends GetView<DatesController> {
  const AddNewDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showAddNewDateModal() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              color: const Color(0xFF737373),
              height: MediaQuery.of(context).size.height * .5,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView(
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return SizedBox(
      child: IconButton(
        icon: const Icon(Icons.add),
        color: Theme.of(context).primaryColor,
        onPressed: () => showAddNewDateModal(),
        iconSize: 30,
      ),
    );
  }
}
