// ignore: file_names
import 'package:flutter/material.dart';
import 'package:diario_el_pueblo/core/constants/DarkColorPalette.dart';
import 'package:diario_el_pueblo/core/constants/LightColorPalette.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: LightColorPalette().primaryColor,
      buttonTheme: ButtonThemeData(
        buttonColor: LightColorPalette().buttonColor,
      ),
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
      ));

  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: DarkColorPalette().primaryColor,
      buttonTheme: ButtonThemeData(
        buttonColor: DarkColorPalette().buttonColor,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: DarkColorPalette().backgroundNavBar,
        indicatorColor: DarkColorPalette().selectedItemNavBar,
        shadowColor: DarkColorPalette().unselectedItemNavBar,
      ),
      appBarTheme:
          AppBarTheme(backgroundColor: DarkColorPalette().backgroundHeader),
      drawerTheme: DrawerThemeData(
        backgroundColor: DarkColorPalette().backgroundDrawer,
        surfaceTintColor: DarkColorPalette().headerDrawer,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: DarkColorPalette().indicatorColor,
        unselectedLabelColor: DarkColorPalette().unselectedLabelTabBar,
        labelColor: DarkColorPalette().selectedLabelTabBar,
      ));
}
