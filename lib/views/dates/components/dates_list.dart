import 'dart:convert';

import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DatesList extends GetView<DatesController> {
  const DatesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var a = [
      {'i': 2, 'i2': 3},
      {'i': 2, 'i2': 3}
    ];
    // for (var key in controller.prices[0]['items'].keys) {
    //   print(key);
    //   print(controller.prices[0]['items'][key]);
    // }
    // controller.prices.asMap().entries.map((item) {
    //   return print(item.key);
    // });
    // print(jsonEncode({'object': 1}));
    // print(controller.prices[0]['items'].length);
    List<Widget> renderSingleCollapse() {
      List<Widget> gameCells = <Widget>[];
      for (var key in controller.prices[0]['items'].keys) {
        gameCells.add(
          Card(
            child: ListTile(
              // onTap: () => _showListInModal(),
              leading: Text(
                key.toString(),
                // style: const TextStyle(
                //     color: Colors.red, fontSize: 16),
              ),
              trailing: Text(
                controller.prices[0]['items'][key].toString(),
                // style: const TextStyle(
                //     color: Colors.red, fontSize: 16),
              ),
            ),
          ),
        );
      }
      ;
      return gameCells;
    }

    print(renderSingleCollapse());

    void _showListInModal() {
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
                      height: 10,
                    ),
                    LimitedBox(
                      child: SvgPicture.asset(
                        'lib/assets/svg/avaLogo.svg',
                        width: 52.5,
                        height: 48,
                      ),
                      maxHeight: 100,
                      maxWidth: 100,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
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
                                      item.value['sellerName'],
                                    ),
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: Column(
                                          children: renderSingleCollapse(),
                                          // [
                                          //   Card(
                                          //     // color: Colors.red,
                                          //     child: ListTile(
                                          //         title: Row(
                                          //       children: const [
                                          //         SizedBox(
                                          //           width: 150,
                                          //           child: Text(
                                          //             'Price',
                                          //             // style: TextStyle(fontSize: 30),
                                          //           ),
                                          //         ),
                                          //         SizedBox(
                                          //           width: 20,
                                          //           child: Text(
                                          //             ':',
                                          //             // style: TextStyle(fontSize: 30),
                                          //           ),
                                          //         ),
                                          //         Text(
                                          //           '123500',
                                          //           // style: TextStyle(fontSize: 30),
                                          //         ),
                                          //       ],
                                          //     )),
                                          //   ),
                                          //   Card(
                                          //     // color: Colors.red,
                                          //     child: ListTile(
                                          //       title: Row(
                                          //         children: const [
                                          //           SizedBox(
                                          //             width: 150,
                                          //             child: Text(
                                          //               'Guarantee',
                                          //               // style: TextStyle(fontSize: 30),
                                          //             ),
                                          //           ),
                                          //           SizedBox(
                                          //             width: 20,
                                          //             child: Text(
                                          //               ':',
                                          //               // style: TextStyle(fontSize: 30),
                                          //             ),
                                          //           ),
                                          //           Text(
                                          //             'yes',
                                          //             // style: TextStyle(fontSize: 30),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ],
                                        ),
                                      )
                                    ],
                                  );
                                  // return Text(date);
                                }).toList(),
                              ),
                            )),
                      ],
                    )
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
                              onTap: () => _showListInModal(),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'list.name',
                                    // style: TextStyle(
                                    //     color: Colors.red, fontSize: 16),
                                  ),
                                  Text(
                                    'list.name',
                                    // style: TextStyle(
                                    //     color: Colors.red, fontSize: 16),
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


// ExpansionTile(
//                       title: Text('Seller One'),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(left: 5, right: 5),
//                           child: Column(
//                             children: [
//                               Card(
//                                 // color: Colors.red,
//                                 child: ListTile(
//                                     title: Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 150,
//                                       child: Text(
//                                         'Price',
//                                         // style: TextStyle(fontSize: 30),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: 20,
//                                       child: Text(
//                                         ':',
//                                         // style: TextStyle(fontSize: 30),
//                                       ),
//                                     ),
//                                     Text(
//                                       '123500',
//                                       // style: TextStyle(fontSize: 30),
//                                     ),
//                                   ],
//                                 )),
//                               ),
//                               Card(
//                                 // color: Colors.red,
//                                 child: ListTile(
//                                   title: Row(
//                                     children: const [
//                                       SizedBox(
//                                         width: 150,
//                                         child: Text(
//                                           'Guarantee',
//                                           // style: TextStyle(fontSize: 30),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                         child: Text(
//                                           ':',
//                                           // style: TextStyle(fontSize: 30),
//                                         ),
//                                       ),
//                                       Text(
//                                         'yes',
//                                         // style: TextStyle(fontSize: 30),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),