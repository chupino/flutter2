// ignore: file_names
import 'package:flutter/material.dart';
import 'package:diario_el_pueblo/core/constants/DarkColorPalette.dart';
import 'package:diario_el_pueblo/core/constants/LightColorPalette.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: LightColorPalette().progressIndicatorColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  LightColorPalette().elevatedButtonBackgroundColor))),
      primaryColor: LightColorPalette().primaryColor,
      listTileTheme:
          ListTileThemeData(tileColor: LightColorPalette().tileColor),
      buttonTheme: ButtonThemeData(
        buttonColor: LightColorPalette().buttonColor,
      ),
      iconTheme: IconThemeData(color: LightColorPalette().iconColor),
      focusColor: LightColorPalette().focusColor,
      dividerTheme: DividerThemeData(color: LightColorPalette().dividerColor),
      navigationBarTheme: NavigationBarThemeData(
          backgroundColor: LightColorPalette().backgroundNavBar,
          indicatorColor: LightColorPalette().selectedItemNavBar,
          shadowColor: LightColorPalette().unselectedItemNavBar),
      appBarTheme:
          AppBarTheme(backgroundColor: LightColorPalette().backgroundHeader),
      drawerTheme: DrawerThemeData(
        backgroundColor: LightColorPalette().backgroundDrawer,
        surfaceTintColor: LightColorPalette().headerDrawer,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: LightColorPalette().indicatorColor,
        unselectedLabelColor: LightColorPalette().unselectedLabelTabBar,
        labelColor: LightColorPalette().selectedLabelTabBar,
      ),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: LightColorPalette().snackBarBackground));

  final darkTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                DarkColorPalette().elevatedButtonBackgroundColor))),
    primaryColor: DarkColorPalette().primaryColor,
    listTileTheme: ListTileThemeData(tileColor: DarkColorPalette().tileColor),
    buttonTheme: ButtonThemeData(
      buttonColor: DarkColorPalette().buttonColor,
    ),
    iconTheme: IconThemeData(color: DarkColorPalette().iconColor),
    focusColor: DarkColorPalette().focusColor,
    dividerTheme: DividerThemeData(color: DarkColorPalette().dividerColor),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: DarkColorPalette().backgroundNavBar,
      indicatorColor: DarkColorPalette().selectedItemNavBar,
      shadowColor: DarkColorPalette().unselectedItemNavBar,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        color: DarkColorPalette().progressIndicatorColor),
    appBarTheme:
        AppBarTheme(backgroundColor: DarkColorPalette().backgroundHeader),
    drawerTheme: DrawerThemeData(
      backgroundColor: DarkColorPalette().backgroundDrawer,
      surfaceTintColor: DarkColorPalette().headerDrawer,
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: DarkColorPalette().tabBarBackgroundColor,
      indicatorColor: DarkColorPalette().indicatorColor,
      unselectedLabelColor: DarkColorPalette().unselectedLabelTabBar,
      labelColor: DarkColorPalette().selectedLabelTabBar,
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: DarkColorPalette().snackBarBackground),
    bottomSheetTheme:
        BottomSheetThemeData(shadowColor: DarkColorPalette().modalOptionsColor),
  );

  static Future<ThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDark') == true
        ? ThemeMode.dark
        : prefs.getBool('isDark') == false
            ? ThemeMode.light
            : ThemeMode.system;
  }
}
