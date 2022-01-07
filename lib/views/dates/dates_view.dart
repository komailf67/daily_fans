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
                  width: 52.5,
                  height: 48,
                ),
                maxHeight: 100,
                maxWidth: 100,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.sort),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
              const DatesList(),
            ],
          ),
        ),
      ),
    );
  }
}
