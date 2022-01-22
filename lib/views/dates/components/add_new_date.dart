import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddNewDate extends GetView<DatesController> {
  const AddNewDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var utils = Get.find<UtilController>();

    void showAddNewDateModal() {
      controller.resetDatesInpute();
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
                                validator: (value) {
                                  if (value != null && value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                autofocus: true,
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
                                      onChanged: (value) {
                                        controller.yearController = value;
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[۱۲۳۴۵۶۷۸۹۰0-9]')),
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                      style: TextStyle(
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .button
                                              ?.fontSize),
                                      textInputAction: TextInputAction.next,
                                      initialValue: controller.yearController,
                                      decoration: const InputDecoration(
                                        labelText: "Year",
                                      ),
                                      validator: (value) {
                                        if (value != null) {
                                          if (value.isEmpty) {
                                            return 'Enter a year';
                                          } else if (value.length < 4) {
                                            return '4 character please';
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: const Text('/'),
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        controller.monthController = value;
                                      },
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
                                      initialValue: controller.monthController,
                                      // controller: controller.monthController,
                                      decoration: const InputDecoration(
                                        labelText: "Month",
                                      ),
                                      validator: (value) {
                                        if (value != null) {
                                          if (value.isEmpty) {
                                            return 'Enter a month';
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5, right: 5),
                                    child: const Text('/'),
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        controller.dayController = value;
                                      },
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
                                      initialValue: controller.dayController,
                                      decoration: const InputDecoration(
                                        labelText: "Day",
                                      ),
                                      validator: (value) {
                                        if (value != null) {
                                          if (value.isEmpty) {
                                            return 'Enter a day';
                                          }
                                        }
                                        return null;
                                      },
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
                                    if (controller.formKey.currentState ==
                                            null ||
                                        !controller.formKey.currentState!
                                            .validate()) return;
                                    // await controller.login();
                                    // Get.toNamed(DatesView.route());
                                    var res = await controller.addNewDate();
                                    if (res != null) {
                                      controller.getDatesList();
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Obx(
                                    //TODO: button kit with loading
                                    () => utils.skeletonLoading.value
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text(
                                            'Submit',
                                            style: TextStyle(
                                                fontSize:
                                                    18), //font size from theme
                                          ),
                                  ),
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
