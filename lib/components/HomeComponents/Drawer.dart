import "package:diario_el_pueblo/core/helpers/LaunchNavigator.dart";
import "package:diario_el_pueblo/utils/Genres.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map> genres = GenresNews().tags;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('assets/images/logo_blanco.png'),
            decoration:
                BoxDecoration(color: Get.theme.drawerTheme.surfaceTintColor),
          ),
          for (var i = 0; i < genres.length; i++)
            ListTile(
              title: Text(
                genres[i]["titulo"],
              ),
              trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    LaunchNavigator().lanzarNavegador(genres[i]["goTo"]);
                  }),
            ),
        ],
      ),
    );
  }
}
