import 'package:daily_fans/enums/auth_enum.dart';
import 'package:daily_fans/globalControllers/util_controller.dart';
import 'package:daily_fans/services/auth/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daily_fans/utils/storage.dart';

const accessTokenStorageTag = "access_token";
const refreshTokenStorageTag = "refresh_token";

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // reactive states
  var isObscure = false.obs;
  var showEmailWidget = false.obs;
  var loading = false.obs;

  // privates
  final _storage = Storage();

  Future login() async {
    var req = LoginServiceRequest(
      username: usernameController.text,
      password: passwordController.text,
    );
    var res = await loginService(req);
    if (res == null) return;
    await _makUserLogin(res);
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void toggleLoading() {
    loading.value = !loading.value;
  }

  // Private logics
  Future _makUserLogin(LoginServiceResponse res) async {
    // if (res.token == null || res.refreshToken == null) return;
    if (res.data.token == null) return;
    // await _setTokens(res.token!, res.refreshToken!.token);
    await _setTokens(res.data.token!, res.data.token!);
    _setLoginStatusToOk();
  }

  Future _setTokens(String accessToken, String refreshToken) async {
    await _storage.setElement(AccessTokenStorageTag, accessToken);
    await _storage.setElement(refreshTokenStorageTag, refreshToken);
  }

  void _setLoginStatusToOk() {
    var utils = Get.find<UtilController>();
    utils.authStatus.value = AuthEnum.Authorized;
  }
}
