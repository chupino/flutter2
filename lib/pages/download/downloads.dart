import 'package:diario_el_pueblo/components/DownloadComponents/DownloadScheme.dart';
import 'package:diario_el_pueblo/components/ExploreComponents/Drawer.dart';
import 'package:flutter/material.dart';

class DownloadsPage extends StatelessWidget {
  int dummy;
  Function(int) changeIndex;
  DownloadsPage({required this.changeIndex, required this.dummy, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAlternative(
        changeIndex: changeIndex,
      ),
      body: CustomScrollView(
        slivers: [

          SliverList(
            delegate: SliverChildListDelegate([
              DownloadScheme(dummy: dummy),
            ]),
          ),
        ],
      ),
    );
  }
}
