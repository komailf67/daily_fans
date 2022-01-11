import 'package:daily_fans/models/date/price_model.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DatesList extends GetView<DatesController> {
  const DatesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> renderSingleCollapse(item) {
      var priceItem = PriceModel(
          description: item['description'],
          price: item['price'],
          portNumber: item['portNumber'],
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

    void _showListInModal(int dateId) {
      controller.emptyPriceList();
      controller.getPriceListByDate(dateId);
      showModalBottomSheet(
          // backgroundColor: Colors.red,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
              color: const Color(0xFF737373),
              height: MediaQuery.of(context).size.height * .8,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    LimitedBox(
                      child: SvgPicture.asset(
                        'lib/assets/svg/avaLogo.svg',
                        width: 50,
                        height: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                      maxHeight: 100,
                      maxWidth: 100,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        children: [
                          Obx(() => SingleChildScrollView(
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
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Container(
      height: MediaQuery.of(context).size.height * .72, //TODO
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
