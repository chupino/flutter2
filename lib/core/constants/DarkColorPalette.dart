import 'package:flutter/material.dart';

class DarkColorPalette {
  //General
  final primaryColor = Colors.black;
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
  final selectedLabelTabBar = Colors.white;
  final unselectedLabelTabBar = Colors.white.withOpacity(0.7);
  final indicatorColor = Colors.white.withOpacity(0.5);
}
