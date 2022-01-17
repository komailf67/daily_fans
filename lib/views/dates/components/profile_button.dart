import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String logout = 'Logout';

  static const List<String> choices = <String>[
    logout,
  ];
}

class ProfileButton extends GetView<UtilController> {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      if (choice == Constants.logout) {
        controller.logout();
      }
    }

    return PopupMenuButton<String>(
      icon: Icon(
        Icons.account_circle_outlined,
        size: 30,
        color: Theme.of(context).primaryColor,
      ),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return Constants.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
