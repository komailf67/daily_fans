import 'package:daily_fans/enums/auth_enum.dart';
import 'package:daily_fans/utils/storage.dart';
import 'package:daily_fans/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String AccessTokenStorageTag = "access_token";

class UtilController extends GetxController {
  var authStatus = AuthEnum.NotChecked.obs;
  var actionLoader = <String>[].obs;
  var skeletonLoader = <String>[].obs;
  var skeletonLoading = false.obs;

  void checkAuth() async {
    var storage = Storage();
    var token = await storage.getElement(AccessTokenStorageTag);
    if (token == null) {
      authStatus.value = AuthEnum.NotAuthorized;
    } else {
      authStatus.value = AuthEnum.Authorized;
    }
  }

  void logout() async {
    var storage = Storage();
    await storage.clearElement(AccessTokenStorageTag);
    authStatus.value = AuthEnum.NotAuthorized;
    Get.toNamed(LoginView.route());
  }

  void toggleSkeletonLoadingState() {
    skeletonLoading.value = !skeletonLoading.value;
  }

  Widget customLoading() {
    return Container(
      child: CircularProgressIndicator(
        value: .5,
        semanticsLabel: 'Linear progress indicator',
      ),
    );
  }
}
