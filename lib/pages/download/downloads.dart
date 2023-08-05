import 'package:diario_el_pueblo/components/DownloadComponents/DownloadScheme.dart';
import 'package:diario_el_pueblo/components/ExploreComponents/Drawer.dart';
import 'package:flutter/material.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerAlternative(),
      body: NestedScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                iconTheme: const IconThemeData(size: 50),
                title: Image.asset('assets/images/logo_blanco.png'),
                pinned: true,
              ),
            ];
          },
          
          body: const DownloadScheme()),
    );
  }
}
