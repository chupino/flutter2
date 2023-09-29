// ignore: file_names
import 'package:diario_el_pueblo/components/ExploreComponents/Drawer.dart';
import 'package:diario_el_pueblo/components/HomeComponents/Drawer.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/pages/download/downloads.dart';
import 'package:diario_el_pueblo/pages/explore/explore.dart';
import 'package:diario_el_pueblo/pages/home/home.dart';
import 'package:diario_el_pueblo/pages/settings/settings.dart';
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
  int dummy = 0;
  void _updateIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _currentIndex == 0
          ? DrawerHome()
          : _currentIndex == 1
              ? DrawerAlternative(changeIndex: _updateIndex)
              : _currentIndex == 2
                  ? DrawerAlternative(changeIndex: _updateIndex)
                  : null,
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
            icon: const Icon(
              FontAwesomeIcons.house,
            ),
            title: const Text(
              "Inicio",
              style: TextStyles.navBarLabel,
            ),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              // ignore: deprecated_member_use
              FontAwesomeIcons.compass,
            ),
            title: const Text("Explorar", style: TextStyles.navBarLabel),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.newspaper,
            ),
            title: const Text("Periodicos", style: TextStyles.navBarLabel),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.settings,
            ),
            title: const Text("Ajustes", style: TextStyles.navBarLabel),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            title: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Image.asset('assets/images/logo_blanco.png'),
            ),
            pinned: true,
          ),
          SliverFillRemaining(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                const HomePage(),
                ExplorePage(
                  changeIndex: _updateIndex,
                ),
                DownloadsPage(
                  changeIndex: _updateIndex,
                  dummy: dummy,
                ),
                const SettingsPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
