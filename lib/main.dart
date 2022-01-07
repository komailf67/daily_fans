import 'package:daily_fans/bindings/initial_binding.dart';
import 'package:daily_fans/middlewares/anti_auth_middleware.dart';
import 'package:daily_fans/theme/deafult_theme.dart';
import 'package:daily_fans/views/dates/dates_binding.dart';
import 'package:daily_fans/views/dates/dates_view.dart';
import 'package:daily_fans/views/login/login_binding.dart';
import 'package:daily_fans/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

var logger = Logger();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // darkTheme: Themes.lightTheme(context),
      theme: Themes.lightTheme(context),
      themeMode: ThemeMode.light,
      initialRoute: DatesView.route(),
      initialBinding: InitialBinding(),
      getPages: [
        GetPage(
          name: LoginView.route(),
          page: () => const LoginView(),
          binding: LoginBinding(),
          middlewares: [
            // AntiAuthMiddleWare(),
          ],
        ),
        GetPage(
          name: DatesView.route(),
          page: () => const DatesView(),
          binding: DatesBinding(),
        ),
      ],
    );
  }
}
