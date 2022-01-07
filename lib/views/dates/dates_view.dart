import 'package:daily_fans/views/dates/components/dates_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DatesView extends GetView {
  const DatesView({Key? key}) : super(key: key);
  static String route() => '/dates';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
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
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.sort),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                    iconSize: 30,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                    iconSize: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const DatesList(),
            ],
          ),
        ),
      ),
    );
  }
}
