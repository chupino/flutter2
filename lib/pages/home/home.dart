import 'package:diario_el_pueblo/components/HomeComponents/Drawer.dart';
import 'package:diario_el_pueblo/components/HomeComponents/Header.dart';
import 'package:diario_el_pueblo/components/HomeComponents/Noticias.dart';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          drawer: DrawerHome(),
          body: TabBarView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              NoticiasScreen(size: size, tabController: tabController),
              test(size, tabController),
              test(size, tabController),
              test(size, tabController),
            ],
          )),
    );
  }

  Center test(Size size, TabController tabController) {
    return Center(
      child: Column(
        children: [
          HeaderHome(
            size: size,
            tabController: tabController,
          ),
          Text("test")
        ],
      ),
    );
  }
}
