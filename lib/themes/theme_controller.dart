import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/shared_prefs_helper.dart';

class ThemeController extends GetxController {
  bool isDark = false;

  @override
  void onInit() async {
    super.onInit();
    isDark = SharedPrefHelper.isDarkTheme();
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void changeTheme(bool _isDark) async {
    isDark = _isDark;
    await SharedPrefHelper.cacheTheme(_isDark);
    Get.changeThemeMode(_isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
