import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NoData extends GetView {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 3,
          decoration: const BoxDecoration(
            // shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('lib/assets/images/nodata-found.png')),
          ),
        ),
        const Text(
          'اطلاعاتی برای نمایش وجود ندارد',
          style: TextStyle(color: Color.fromRGBO(21, 73, 131, .8)),
        )
      ],
    );
  }
}
