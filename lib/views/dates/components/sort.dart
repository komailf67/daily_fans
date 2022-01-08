import 'package:daily_fans/views/dates/dates_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Sort extends GetView<DatesController> {
  const Sort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.sort,
        color: Theme.of(context).primaryColor,
      ),
      itemBuilder: (context) => const [
        PopupMenuItem(
          child: Text("First"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Second"),
          value: 2,
        )
      ],
    );
  }
}
