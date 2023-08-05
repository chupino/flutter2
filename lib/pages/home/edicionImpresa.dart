import 'package:diario_el_pueblo/components/EdicionImpresaComponents/EdicionImpresaScheme.dart';
import 'package:flutter/material.dart';

class EdicionImpresaScreen extends StatelessWidget {
  final TabController tabController;
  const EdicionImpresaScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EdicionImpresaScheme(
        tabController: tabController,
      ),
    );
  }
}
