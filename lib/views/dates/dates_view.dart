import 'package:daily_fans/views/common/no_data.dart';
import 'package:daily_fans/views/dates/components/add_new_date.dart';
import 'package:daily_fans/views/dates/components/dates_list.dart';
import 'package:daily_fans/views/dates/components/profile_button.dart';
import 'package:daily_fans/views/dates/components/sort.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatesView extends GetView<DatesController> {
  const DatesView({Key? key}) : super(key: key);
  static String route() => '/dates';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
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
                  children: [
                    Sort(),
                    ProfileButton(),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => controller.getDatesListLoading.isFalse &&
                          controller.dates.isEmpty
                      ? const NoData()
                      : const DatesList(),
                ),
                // const DatesList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const AddNewDate(),
    );
  }
}
