// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerAlternative extends StatelessWidget {
  const DrawerAlternative({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration:
                BoxDecoration(color: Get.theme.drawerTheme.surfaceTintColor),
            child: Image.asset('assets/images/logo_blanco.png'),
          ),
          ListTile(
            title: const Text(
              "Ajustes",
            ),
            leading:
                IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
