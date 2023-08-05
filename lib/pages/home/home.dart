import 'package:diario_el_pueblo/components/HomeComponents/Drawer.dart';
import 'package:diario_el_pueblo/components/HomeComponents/NoticiasScheme.dart';
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
        TabController(length: 4, vsync: this, animationDuration: Duration.zero);
    return Scaffold(
      drawer: const DrawerHome(),
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          // Agrega esta línea
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                iconTheme: const IconThemeData(size: 50),
                title: Image.asset('assets/images/logo_blanco.png'),
                expandedHeight: 50,
                pinned: true,
              ),
              SliverAppBar(
                backgroundColor: Get.theme.primaryColor.withOpacity(0.2),
                floating: true,
                automaticallyImplyLeading: false,
                primary: false,
                elevation: 8.0,
                pinned: false,
                title: Material(
                  color: Colors.transparent,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Get.theme.tabBarTheme.indicatorColor,
                    tabs: const [
                      Tab(text: 'LO ÚLTIMO'),
                      Tab(text: 'EDICIÓN DE HOY'),
                      Tab(text: 'CONTRATAR ANUNCIO'),
                      Tab(text: 'SE NUESTRO CORRESPONSAL'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                NoticiasScreen(size: size, tabController: tabController),
                EdicionImpresaScreen(tabController: tabController),
                const AnunciosPage(),
                const CorresponsalScreen()
              ]),
        ), // Agrega esta línea
      ),
    );
  }

  Center test(Size size, TabController tabController) {
    return const Center(
      child: Column(
        children: [Text("test")],
      ),
    );
  }
}
