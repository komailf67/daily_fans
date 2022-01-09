import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Sort extends GetView<DatesController> {
  const Sort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void changeSort() {
      var utils = Get.find<UtilController>();
      utils.logout();
      // controller.changeSortDates();
    }

    return Obx(
      () => Container(
        margin: EdgeInsets.only(left: 5),
        child: IconButton(
          icon: Icon(
            controller.descending.isTrue
                ? Icons.arrow_downward
                : Icons.arrow_upward,
            color: Theme.of(context).primaryColor,
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () => changeSort(),
          iconSize: 30,
        ),
      ),
    );
  }
}
