import 'package:diario_el_pueblo/components/HomeComponents/Drawer.dart';
import 'package:diario_el_pueblo/components/HomeComponents/NoticiasScheme.dart';
import 'package:diario_el_pueblo/core/constants/DarkColorPalette.dart';
import 'package:diario_el_pueblo/core/constants/LightColorPalette.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/pages/home/ForoScreen.dart';
import 'package:diario_el_pueblo/pages/home/anuncios.dart';
import 'package:diario_el_pueblo/pages/home/corresponsal.dart';
import 'package:diario_el_pueblo/pages/home/edicionImpresa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    TabController tabController =
        TabController(length: 5, vsync: this, animationDuration: Duration.zero);
    return Scaffold(
      drawer: const DrawerHome(),
      body: NestedScrollView(

          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                
                pinned: false,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                primary: false,
                elevation: 8.0,
                title: Material(
                  color: Colors.transparent,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Colors.green,
                    labelStyle: TextStyles.tabsHome,
                    tabs: const [
                      Tab(text: 'LO ÚLTIMO'),
                      Tab(text: 'EDICIÓN DE HOY'),
                      Tab(text: 'CONTRATAR ANUNCIO'),
                      Tab(text: 'FORO'),
                      Tab(text: 'SE NUESTRO CORRESPONSAL'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: DefaultTabController(
            length: 5,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                NoticiasScreen(size: size, tabController: tabController),
                EdicionImpresaScreen(tabController: tabController),
                const AnunciosPage(),
                const ForoScreen(),
                const CorresponsalScreen(),
              ],
            ),
          )),
    );
  }
}
