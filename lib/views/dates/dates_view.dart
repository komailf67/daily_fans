import 'package:daily_fans/views/dates/components/add_new_date.dart';
import 'package:daily_fans/views/dates/components/dates_list.dart';
import 'package:daily_fans/views/dates/components/sort.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatesView extends GetView {
  const DatesView({Key? key}) : super(key: key);
  static String route() => '/dates';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
              child: Container(
            margin: EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('lib/assets/images/logo.jpg')),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Sort(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const DatesList(),
              ],
            ),
          )),
        ),
        floatingActionButton: AddNewDate());
  }
}
