import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:flutter/services.dart';
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
              // height: MediaQuery.of(context).size.height *
              //     .5, //TODO after open keyboard
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Form(
                        key: controller.formKey,
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              const Text('Add new date'),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.fontSize),
                                textInputAction: TextInputAction.next,
                                controller: controller.titleController,
                                decoration: const InputDecoration(
                                  labelText: "Title",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[۱۲۳۴۵۶۷۸۹۰0-9]')),
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .button
                                              ?.fontSize),
                                      textInputAction: TextInputAction.next,
                                      controller: controller.yearController,
                                      decoration: const InputDecoration(
                                        labelText: "Year",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: const Text('/'),
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[۱۲۳۴۵۶۷۸۹۰0-9]')),
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .button
                                              ?.fontSize),
                                      textInputAction: TextInputAction.next,
                                      controller: controller.monthController,
                                      decoration: const InputDecoration(
                                        labelText: "Month",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: const Text('/'),
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[۱۲۳۴۵۶۷۸۹۰0-9]')),
                                        LengthLimitingTextInputFormatter(2),
                                      ],
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .button
                                              ?.fontSize),
                                      textInputAction: TextInputAction.next,
                                      controller: controller.dayController,
                                      decoration: const InputDecoration(
                                        labelText: "Day",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // if (controller.formKey.currentState == null ||
                                    //     !controller.formKey.currentState!.validate())
                                    //   return;
                                    // await controller.login();
                                    // Get.toNamed(DatesView.route());
                                    var res = await controller.addNewDate();
                                    if (res != null) {
                                      controller.getDatesList();
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return SizedBox(
      child: FloatingActionButton(
        onPressed: () => showAddNewDateModal(),
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
