import 'package:daily_fans/views/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView {
  const LoginView({Key? key}) : super(key: key);

  static String route() => '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
