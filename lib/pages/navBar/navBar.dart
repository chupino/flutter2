import 'package:diario_el_pueblo/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  static const routeName = '/main_app';

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Get.theme.navigationBarTheme.backgroundColor,
        selectedItemColor: Get.theme.navigationBarTheme.indicatorColor,
        unselectedItemColor: Get.theme.navigationBarTheme.shadowColor,
        currentIndex: _currentIndex,
        onTap: (i) => setState(
          () => _currentIndex = i,
        ),
        selectedColorOpacity: 0.2,
        items: [
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.house,
            ),
            title: Text("Inicio"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.search,
            ),
            title: Text("Explorar"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              FontAwesomeIcons.download,
            ),
            title: Text("Descargas"),
          ),
          SalomonBottomBarItem(
            icon: Icon(
              Icons.settings,
            ),
            title: Text("Ajustes"),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(),
          HomePage(),
          HomePage(),
          HomePage(),
        ],
      ),
    );
  }
}
