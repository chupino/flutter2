import 'package:diario_el_pueblo/components/ExploreComponents/Drawer.dart';
import 'package:diario_el_pueblo/components/ExploreComponents/ExploreScheme.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAlternative(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                iconTheme: const IconThemeData(size: 50),
                title: Image.asset('assets/images/logo_blanco.png'),
                expandedHeight: 50,
                pinned: true,
              ),
            ];
          },
          body: const ExploreScheme()),
    );
  }
}
