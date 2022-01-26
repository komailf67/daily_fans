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
    return Obx(
      () => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Sort(),
                      ProfileButton(),
                    ],
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                background: Image.asset('lib/assets/images/logo.jpg'),
              ),
            ),
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return SafeArea(
                      child: Center(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Obx(
                                () => controller.getDatesListLoading.isFalse &&
                                        controller.dates.isEmpty
                                    ? const NoData()
                                    : const DatesList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: const AddNewDate(),
      ),
    );
  }
}
