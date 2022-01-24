import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/models/color/color_model.dart';
import 'package:daily_fans/models/date/price_model.dart';
import 'package:daily_fans/views/common/no_data.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:flutter_slidable/flutter_slidable.dart';

enum SingingCharacter { lafayette, jefferson }

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

enum ModalType { create, edit }

class DatesList extends GetView<DatesController> {
  const DatesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var utils = Get.find<UtilController>();

    void _showAddNewPriceListInModal(
        int dateId, int priceId, ModalType modalType) {
      List<int> colorsValues = [];
      for (var item in controller.colors) {
        colorsValues.add(item.id);
      }
      if (colorsValues.isNotEmpty) {
        controller.changeSelectedColor(colorsValues[0]);
      }

      if (modalType == ModalType.edit) {
        controller.prepareEditPriceList(priceId);
      } else if (modalType == ModalType.create) {
        controller.emptyNewProductDetailsObject();
      }
      controller.setPriceListId(dateId);
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(255, 59, 59, 59),
                // height: MediaQuery.of(context).size.height *
                //     .65, //TODO after open keyboard
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
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
                                  initialValue:
                                      controller.productDetails.value.title,
                                  autofocus: true,
                                  onChanged: (text) => controller
                                      .handleNewProductDetails('title', text),
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .button
                                          ?.fontSize),
                                  textInputAction: TextInputAction.next,
                                  // controller: controller.titleController,
                                  decoration: const InputDecoration(
                                    labelText: "Title",
                                  ),
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  initialValue: controller
                                      .productDetails.value.description,
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
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  initialValue: controller
                                              .productDetails.value.price !=
                                          null
                                      ? controller.productDetails.value.price
                                          .toString()
                                      : '',
                                  keyboardType: TextInputType.number,
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
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  initialValue: controller
                                      .productDetails.value.partNumber,
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
                                  validator: (value) {
                                    if (value != null && value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        initialValue: controller.productDetails
                                                    .value.yearModel !=
                                                null
                                            ? controller
                                                .productDetails.value.yearModel
                                                .toString()
                                            : '',
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
                                        validator: (value) {
                                          if (value != null) {
                                            if (value.isEmpty) {
                                              return 'Please enter some text';
                                            } else if (value.length < 4) {
                                              return '4 character please!';
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
                                Container(
                                  height: 50,
                                  // color: Colors.red,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
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
                                          color: Color.fromARGB(
                                              255, 110, 107, 107),
                                          fontSize: 16,
                                        ),
                                      ),
                                      Obx(
                                        () => CupertinoSwitch(
                                          value: modalType == ModalType.create
                                              ? controller.hasGuarantee.isTrue
                                              : controller.productDetails.value
                                                  .hasGuarantee!,
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
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
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
                                  child: Container(
                                    constraints: BoxConstraints(minHeight: 50),
                                    // color: Colors.red,
                                    child: Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Color',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 110, 107, 107),
                                              fontSize: 16,
                                            ),
                                          ),
                                          DropdownButton<String>(
                                            value: modalType == ModalType.create
                                                ? controller
                                                    .selectedColorValue.value
                                                    .toString()
                                                : controller.productDetails
                                                    .value.color?.id
                                                    .toString(),
                                            elevation: 16,
                                            onChanged: (String? newValue) {
                                              controller.changeSelectedColor(
                                                int.parse(newValue!),
                                              );
                                            },
                                            items: controller.colors
                                                .asMap()
                                                .entries
                                                .map(
                                              (color) {
                                                return DropdownMenuItem<String>(
                                                  value:
                                                      color.value.id.toString(),
                                                  child: Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                      color: HexColor.fromHex(
                                                          color.value.hex),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                      if (controller.formKey.currentState ==
                                              null ||
                                          !controller.formKey.currentState!
                                              .validate()) return;

                                      var res = modalType == ModalType.create
                                          ? await controller
                                              .addNewProductDetails()
                                          : await controller.editPiceList();
                                      if (res != null) {
                                        // controller.getDatesList();
                                        controller.getPriceListByDate(dateId);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Obx(
                                      //TODO: button kit with loading
                                      () => utils.skeletonLoading.value
                                          ? const SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
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
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }

    void deleteDate(BuildContext context, int dateId, int index) {
      controller.deleteDate(dateId, index);
    }

    void deletePriceList(BuildContext context, int priceId, int index) {
      controller.deletePriceList(priceId, index);
    }

    void editPrice(BuildContext context, int dateId, int priceId) {
      _showAddNewPriceListInModal(dateId, priceId, ModalType.edit);
      // controller.deleteDate(dateId, index);
    }

    List<Widget> renderSingleCollapse(PriceModel item) {
      PriceModel priceItem = PriceModel(
        description: item.description,
        price: item.price,
        partNumber: item.partNumber,
        yearModel: item.yearModel,
        color: ColorType(
            id: item.color!.id, title: item.color!.title, hex: item.color!.hex),
        hasGuarantee: item.hasGuarantee,
      );

      List<Widget> gameCells = <Widget>[];
      priceItem.toJson().forEach((final String key, final value) {
        if (value != null) {
          gameCells.add(
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                child: ListTile(
                  // onTap: () => _showPriceListModal(),
                  leading: Text(
                    key.toString(),
                  ),
                  trailing: value is ColorType
                      ? Container(
                          decoration: BoxDecoration(
                            color: HexColor.fromHex(value.hex),
                            shape: BoxShape.circle,
                          ),
                          width: 20,
                          height: 20,
                        )
                      : Text(
                          value.toString(),
                        ),
                ),
              ),
            ),
          );
        }
      });
      return gameCells;
    }

    void _showPriceListModal(int dateId) {
      ScrollController _scrollController = ScrollController();
      showModalBottomSheet(
          // backgroundColor: Colors.red,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Obx(
              () => Container(
                color: const Color(0xFF737373),
                height: controller.prices.isNotEmpty
                    ? MediaQuery.of(context).size.height * .7
                    : MediaQuery.of(context).size.height * .5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: controller.getPriceListLoading.isFalse &&
                          controller.prices.isEmpty
                      ? Column(
                          children: [
                            closeModal(context),
                            buildPadding(_showAddNewPriceListInModal, dateId, 0,
                                context, ModalType.create),
                            SizedBox(
                              height: 50,
                            ),
                            NoData(),
                          ],
                        )
                      : Column(
                          children: [
                            // if (controller.prices.isNotEmpty)
                            closeModal(context),
                            buildPadding(_showAddNewPriceListInModal, dateId, 0,
                                context, ModalType.create),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: controller.prices.isNotEmpty
                                  ? MediaQuery.of(context).size.height * .55
                                  : MediaQuery.of(context).size.height * 0,
                              child: ListView(
                                shrinkWrap: true,
                                controller: _scrollController,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: controller.prices
                                              .asMap()
                                              .entries
                                              .map((item) {
                                            int idx = item.key + 1;
                                            // String val = user.value;
                                            return Slidable(
                                              key: ValueKey(item.key),
                                              endActionPane: ActionPane(
                                                motion: const ScrollMotion(),
                                                children: [
                                                  SlidableAction(
                                                    onPressed: (context) =>
                                                        deletePriceList(
                                                            context,
                                                            item.value.id!,
                                                            item.key),
                                                    backgroundColor: Colors.red,
                                                    foregroundColor:
                                                        Colors.white,
                                                    label: 'Delete',
                                                  ),
                                                  SlidableAction(
                                                    onPressed: (context) =>
                                                        editPrice(
                                                            context,
                                                            dateId,
                                                            item.value.id!),
                                                    backgroundColor:
                                                        Colors.blue,
                                                    foregroundColor:
                                                        Colors.white,
                                                    label: 'Edit',
                                                  ),
                                                ],
                                              ),
                                              child: ExpansionTile(
                                                title: Text(
                                                  item.value.title!,
                                                ),
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Column(
                                                      children:
                                                          renderSingleCollapse(
                                                              item.value),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          });
    }

    return SizedBox(
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
                        children: controller.dates.asMap().entries.map((date) {
                          int idx = date.key + 1;
                          return Slidable(
                            child: Card(
                              child: ListTile(
                                onTap: () async {
                                  controller.emptyPriceList();
                                  bool res = await controller
                                      .getPriceListByDate(date.value.id!);
                                  if (res) {}
                                  _showPriceListModal(date.value.id!);
                                },
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      date.value.dateTime.toString(),
                                    ),
                                    Text(
                                      date.value.title.toString(),
                                    ),
                                  ],
                                ),
                                leading: Text(
                                  idx.toString(),
                                ),
                                trailing: IconButton(
                                  icon: controller.dates[date.key].loading
                                      ? SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: CircularProgressIndicator(
                                            color:
                                                Theme.of(context).primaryColor,
                                            strokeWidth: 3,
                                          ),
                                        )
                                      : Icon(
                                          Icons.share,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () =>
                                      controller.sendDatesToContacts(
                                    date.value.id!,
                                    date.key,
                                  ),
                                  iconSize: 25,
                                ),
                              ),
                            ),
                            key: ValueKey(date.key),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) => deleteDate(
                                      context, date.value.id!, date.key),
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  label: 'Delete',
                                ),
                              ],
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

  Transform closeModal(BuildContext context) {
    return Transform.rotate(
      angle: 45 * math.pi / 90,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: Theme.of(context).primaryColor,
        icon: const Icon(
          Icons.arrow_forward_ios,
          size: 25,
        ),
      ),
    );
  }

  Padding buildPadding(
      void _showAddNewPriceListInModal(
          int dateId, int priceId, ModalType modalType),
      int dateId,
      int priceId,
      BuildContext context,
      ModalType modalType) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: 65,
          height: 30,
          child: ButtonTheme(
            // minWidth: 200.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: RaisedButton(
                elevation: 0.0,
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () =>
                    _showAddNewPriceListInModal(dateId, priceId, modalType)),
          ),
          //     FloatingActionButton(
          //   shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          //   onPressed: () => _showAddNewPriceListInModal(dateId),
          //   backgroundColor: Theme.of(context).primaryColor,
          //   child: Text(
          //     'Add',
          //     style: TextStyle(color: Colors.white, fontSize: 14),
          //   ),
          // ),
        ),
      ),
    );
  }
}
