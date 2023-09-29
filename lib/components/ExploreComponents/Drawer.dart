// ignore: file_names
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DrawerAlternative extends StatelessWidget {
  Function(int) changeIndex;
  DrawerAlternative({required this.changeIndex, super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Get.theme.listTileTheme.tileColor,
      child: Container(
        color: Get.theme.scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Get.theme.drawerTheme.surfaceTintColor),
              child: Image.asset('assets/images/logo_blanco.png'),
            ),
            ListTile(
              onTap: () {
                changeIndex(3);
              },
              title: const Text(
                "Ajustes",
                style: TextStyles.drawerTiles,
              ),
              leading: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
