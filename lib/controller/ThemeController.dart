import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  Future<bool> isDark() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark');
    if (isDark != null) {
      print(isDark);
      return isDark;
    } else {
      print(isDark);
      prefs.setBool('isDark', Get.isDarkMode);
      return Get.isDarkMode;
    }
  }
  Future<void> switchToDark() async {
    final prefs = await SharedPreferences.getInstance();

      Get.changeThemeMode(ThemeMode.dark);
      prefs.setBool('isDark', true);
    
  }
  Future<void> switchToLight() async {
    final prefs = await SharedPreferences.getInstance();

      Get.changeThemeMode(ThemeMode.light);
      prefs.setBool('isDark', false);
  }
  Future<void> switchTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark');
    if (isDark == true) {
      Get.changeThemeMode(ThemeMode.light);
      prefs.setBool('isDark', false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      prefs.setBool('isDark', true);
    }
  }
}
