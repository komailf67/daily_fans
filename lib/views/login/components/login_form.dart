import 'package:daily_fans/theme/theme_constants.dart';
import 'package:daily_fans/views/dates/dates_view.dart';
import 'package:daily_fans/views/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isChecked = false;
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LimitedBox(
                  child: SvgPicture.asset(
                    'lib/assets/svg/avaLogo.svg',
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                  ),
                  maxHeight: 100,
                  maxWidth: 100,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.subtitle1?.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: TextFormField(
                          style: TextStyle(
                              color: inputTextColor,
                              fontSize:
                                  Theme.of(context).textTheme.button?.fontSize),
                          controller: controller.usernameController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: "Email address",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Fill this field";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        child: TextFormField(
                          style: TextStyle(
                              color: inputTextColor,
                              fontSize:
                                  Theme.of(context).textTheme.button?.fontSize),
                          textInputAction: TextInputAction.next,
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         SizedBox(
                //           height: 24.0,
                //           width: 24.0,
                //           child: Checkbox(
                //             checkColor: Colors.white,
                //             // fillColor: MaterialStateProperty.resolveWith(getColor),
                //             value: isChecked,
                //             onChanged: (bool? value) {
                //               // setState(() {
                //               //   isChecked = value!;
                //               // });
                //             },
                //           ),
                //         ),
                //         Text(
                //           'Remember me',
                //           style: TextStyle(color: Colors.black), //TODO:color
                //         ),
                //       ],
                //     ),
                //     Text(
                //       'Forgot your password?',
                //       style: TextStyle(color: Color(0xffE6007E)),
                //     ),
                //   ],
                // ),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                      onPressed: () async {
                        // if (controller.formKey.currentState == null ||
                        //     !controller.formKey.currentState!.validate())
                        //   return;
                        // await controller.login();
                        Get.toNamed(DatesView.route());
                      },
                      child: Obx(
                        () => controller.loading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Sign in'),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
// MediaQuery.of(context).size.height
