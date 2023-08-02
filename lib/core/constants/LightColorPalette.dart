import 'package:flutter/material.dart';

class LightColorPalette {
  //General
  final primaryColor = Colors.green;
  final buttonColor = Colors.green;

  //NavBar
  final backgroundNavBar = const Color.fromARGB(255, 34, 97, 36);
  final selectedItemNavBar = const Color.fromARGB(255, 68, 210, 85);
  final unselectedItemNavBar = const Color.fromARGB(255, 59, 181, 65);

  //Header
  final backgroundHeader = const Color.fromARGB(255, 76, 164, 78);

  //Drawer
  final backgroundDrawer = Colors.green;
  final headerDrawer = const Color.fromARGB(255, 25, 73, 26);

  //TabBar
  final selectedLabelTabBar = Colors.white.withOpacity(0.8);
  final unselectedLabelTabBar = Colors.white;
  final indicatorColor = Colors.white.withOpacity(0.5);
}
