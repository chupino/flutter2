import 'package:diario_el_pueblo/components/ExploreComponents/Drawer.dart';
import 'package:diario_el_pueblo/components/ExploreComponents/ExploreScheme.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  Function(int) changeIndex;
  ExplorePage({
    required this.changeIndex,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAlternative(changeIndex: changeIndex,),
      body:  ExploreScheme(),
    );
  }
}
