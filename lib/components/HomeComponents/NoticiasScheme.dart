import 'package:diario_el_pueblo/components/HomeComponents/Notas.dart';
import 'package:diario_el_pueblo/components/HomeComponents/Portada.dart';
import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(children: [
        PortadaHome(tabController: widget.tabController),
        const NotasHome()
      ]),
    );
  }
}
