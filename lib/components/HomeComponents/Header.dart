import "package:flutter/material.dart";
import "package:get/get.dart";

class HeaderHome extends StatefulWidget {
  final Size size;
  final TabController tabController;
  const HeaderHome(
      {required this.tabController, required this.size, super.key});

  @override
  State<HeaderHome> createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: widget.size.height * 0.24,
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            decoration: BoxDecoration(
              /* gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green, Color.fromARGB(255, 24, 62, 6)],
                ), */
              color: Get.theme.appBarTheme.backgroundColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 50,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    Flexible(
                        child: Image.asset('assets/images/logo_blanco.png'))
                  ],
                ),
                TabBar(
                  controller: widget.tabController,
                  isScrollable: true,
                  indicatorColor: Get.theme.tabBarTheme.indicatorColor,
                  tabs: const [
                    Tab(text: 'LO ÚLTIMO'),
                    Tab(text: 'EDICIÓN DE HOY'),
                    Tab(text: 'CONTRATAR ANUNCIO'),
                    Tab(text: 'SE NUESTRO CORRESPONSAL'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
