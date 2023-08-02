import 'package:diario_el_pueblo/components/HomeComponents/Header.dart';
import 'package:diario_el_pueblo/components/HomeComponents/HeaderDelegate.dart';
import 'package:diario_el_pueblo/components/HomeComponents/Notas.dart';
import 'package:diario_el_pueblo/components/HomeComponents/Portada.dart';
import 'package:diario_el_pueblo/controller/PortadaController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticiasScreen extends StatefulWidget {
  final Size size;
  final TabController tabController;
  const NoticiasScreen(
      {required this.size, required this.tabController, super.key});

  @override
  State<NoticiasScreen> createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
            delegate: HeaderDelegateHome(
                size: widget.size, tabController: widget.tabController),
            pinned: true),
        SliverList(
            delegate: SliverChildListDelegate([
          PortadaHome(tabController: widget.tabController),
          const NotasHome()
        ]))
      ],
      /* child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderHome(
            size: widget.size,
            tabController: widget.tabController,
          ),
          
        ],
      ), */
    );
  }
}
