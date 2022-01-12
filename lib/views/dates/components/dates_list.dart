import 'package:daily_fans/models/date/price_model.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DatesList extends GetView<DatesController> {
  const DatesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> renderSingleCollapse(item) {
      var priceItem = PriceModel(
          description: item['description'],
          price: item['price'],
          partNumber: item['partNumber'],
          yearModel: item['yearModel'],
          color: item['color'].toString(),
          hasGuarantee: item['hasGuarantee']);
      List<Widget> gameCells = <Widget>[];

      priceItem.toJson().forEach((final String key, final value) {
        if (value != null) {
          gameCells.add(Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Card(
              child: ListTile(
                // onTap: () => _showListInModal(),
                leading: Text(
                  key.toString(),
                ),
                trailing: Text(
                  value.toString(),
                ),
              ),
            ),
          ));
        }
      });
      return gameCells;
    }

    void changeColor(Color color) {
      // setState(() => pickerColor = color);
    }
    void _showAddNewPriceListInModal(int dateId) {
      controller.setPriceListId(dateId);
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              color: Color.fromARGB(255, 59, 59, 59),
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
                              const Text('Add new list'),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                onChanged: (text) => controller
                                    .handleNewProductDetails('title', text),
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
                              TextFormField(
                                onChanged: (text) =>
                                    controller.handleNewProductDetails(
                                        'description', text),
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.fontSize),
                                textInputAction: TextInputAction.next,
                                // controller: controller.titleController,
                                decoration: const InputDecoration(
                                  labelText: "Description",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                onChanged: (text) => controller
                                    .handleNewProductDetails('price', text),
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.fontSize),
                                textInputAction: TextInputAction.next,
                                // controller: controller.titleController,
                                decoration: const InputDecoration(
                                  labelText: "Price",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                onChanged: (text) =>
                                    controller.handleNewProductDetails(
                                        'partNumber', text),
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.fontSize),
                                textInputAction: TextInputAction.next,
                                // controller: controller.titleController,
                                decoration: const InputDecoration(
                                  labelText: "Part number",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Flexible(
                                    child: TextFormField(
                                      onChanged: (text) =>
                                          controller.handleNewProductDetails(
                                              'yearModel', text),
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
                                      // controller: controller.yearController,
                                      decoration: const InputDecoration(
                                        labelText: "Year model",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // ColorPicker(
                              //   pickerColor: Colors.red,
                              //   onColorChanged: controller.toogleColor,
                              //   colorPickerWidth: 300,
                              //   pickerAreaHeightPercent: 0.7,
                              //   // enableAlpha:
                              //   //     _enableAlpha4, // hexInputController will respect it too.
                              //   displayThumbColor: true,
                              //   paletteType: PaletteType.hueWheel,
                              //   labelTypes: const [],
                              //   pickerAreaBorderRadius: const BorderRadius.only(
                              //     topLeft: Radius.circular(2),
                              //     topRight: Radius.circular(2),
                              //   ),
                              //   // hexInputController: textController, // <- here
                              //   portraitOnly: true,
                              // ),
                              Container(
                                height: 50,
                                // color: Colors.red,
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                // alignment: ,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  // color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 212, 212, 212),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Has guarantee',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 77, 75, 75),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Obx(
                                      () => CupertinoSwitch(
                                        value: controller.hasGuarantee.isTrue,
                                        onChanged: (value) {
                                          controller.toggleGuarantee();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 50,
                                // color: Colors.red,
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                // alignment: ,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).canvasColor,
                                  // color: Colors.red,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 212, 212, 212),
                                    width: 1,
                                  ),
                                ),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Color',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 77, 75, 75),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Wrap(
                                      runSpacing: 3.0,
                                      spacing: 3.0,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.selectColor(2);
                                          },
                                          child: Text('Button'),
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(24),
                                            primary: Colors.black,
                                            minimumSize: const Size(20, 20),
                                            maximumSize: const Size(30, 30),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.selectColor(3);
                                          },
                                          child: Text('Button'),
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(24),
                                            primary: Colors.blue,
                                            minimumSize: const Size(20, 20),
                                            maximumSize: const Size(30, 30),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.selectColor(4);
                                          },
                                          child: Text('Button'),
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(24),
                                            primary:
                                                Color.fromARGB(255, 12, 50, 82),
                                            minimumSize: const Size(20, 20),
                                            maximumSize: const Size(30, 30),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.selectColor(1);
                                          },
                                          child: Text('Button'),
                                          style: ElevatedButton.styleFrom(
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(24),
                                            primary: Colors.white,
                                            minimumSize: const Size(20, 20),
                                            maximumSize: const Size(30, 30),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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

                                    var res =
                                        await controller.addNewProductDetails();
                                    if (res != null) {
                                      // controller.getDatesList();
                                      controller.getPriceListByDate(dateId);
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

    void _showListInModal(int dateId) {
      controller.emptyPriceList();
      controller.getPriceListByDate(dateId);
      showModalBottomSheet(
          // backgroundColor: Colors.red,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Obx(() => Container(
                  color: const Color(0xFF737373),
                  // height: controller.prices.length > 0
                  //     ? MediaQuery.of(context).size.height *
                  //         (controller.prices.length + 1) *
                  //         .14
                  //     : MediaQuery.of(context).size.height * .2, //TODO
                  height: MediaQuery.of(context).size.height * .7,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                // fit: BoxFit.fill,
                                image:
                                    AssetImage('lib/assets/images/logo.jpg')),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: controller.prices
                                      .asMap()
                                      .entries
                                      .map((item) {
                                    int idx = item.key + 1;
                                    // String val = user.value;
                                    return ExpansionTile(
                                      title: Text(
                                        item.value['title'],
                                      ),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Column(
                                            children: renderSingleCollapse(
                                                item.value),
                                          ),
                                        ),
                                      ],
                                    );
                                    // return Text(date);
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () => _showAddNewPriceListInModal(dateId),
                          backgroundColor: Theme.of(context).primaryColor,
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
          });
    }

    return Container(
      height: MediaQuery.of(context).size.height * .7, //TODO
      child: ListView(
        shrinkWrap: true,
        // padding: EdgeInsets.all(15.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                Obx(() => SingleChildScrollView(
                      child: Column(
                        children: controller.dates.asMap().entries.map((user) {
                          int idx = user.key + 1;
                          // String val = user.value;
                          return Card(
                            child: ListTile(
                              onTap: () => _showListInModal(user.value['id']),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    user.value['dateTime'].toString(),
                                  ),
                                  Text(
                                    user.value['title'].toString(),
                                  )
                                ],
                              ),
                              leading: Text(
                                idx.toString(),
                                // style: const TextStyle(
                                //     color: Colors.red, fontSize: 16),
                              ),
                            ),
                          );
                          // return Text(date);
                        }).toList(),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
