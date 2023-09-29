import "package:diario_el_pueblo/core/helpers/LaunchNavigator.dart";
import "package:diario_el_pueblo/core/helpers/TextStyles.dart";
import "package:diario_el_pueblo/utils/Genres.dart";
import "package:diario_el_pueblo/utils/Urls.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map> genres = GenresNews().tags;
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
            Theme(
              data: Get.theme.copyWith(dividerColor: Colors.transparent),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PRINCIPAL',
                      style: TextStyles.drawerSections,
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.formAnuncio);
                      },
                      title: const Text(
                        'Contratar Anuncio',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(FontAwesomeIcons.ad),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.editorial);
                      },
                      title: const Text(
                        'Editorial',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(FontAwesomeIcons.edit),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('CATEGORIAS', style: TextStyles.drawerSections),
                    ExpansionTile(
                      iconColor: Colors.green,
                      textColor: Colors.green,
                      childrenPadding:
                          const EdgeInsetsDirectional.only(start: 20),
                      leading: const Icon(FontAwesomeIcons.newspaper),
                      title: const Text(
                        'Noticias',
                        style: TextStyles.drawerTiles,
                      ),
                      children: [
                        ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                          ),
                          onTap: () {
                            LaunchNavigator().lanzarNavegador(Urls.locales);
                          },
                          minVerticalPadding: 0,
                          title: const Text(
                            'Locales',
                            style: TextStyles.drawerTiles,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            LaunchNavigator().lanzarNavegador(Urls.regional);
                          },
                          leading: const Icon(FontAwesomeIcons.globeAmericas),
                          title: const Text(
                            'Regionales',
                            style: TextStyles.drawerTiles,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            LaunchNavigator().lanzarNavegador(Urls.nacional);
                          },
                          leading: const Icon(FontAwesomeIcons.flag),
                          title: const Text(
                            'Nacionales',
                            style: TextStyles.drawerTiles,
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.foro);
                      },
                      title: const Text(
                        'Habla el Sur',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.emoji_people_sharp),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.entrevistas);
                      },
                      title: const Text(
                        'Entrevistas',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(FontAwesomeIcons.microphone),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.especiales);
                      },
                      title: const Text(
                        'Especiales',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.star),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.economia);
                      },
                      title: const Text(
                        'Economia',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.monetization_on),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.politica);
                      },
                      title: const Text(
                        'Politica',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.policy),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.cultura);
                      },
                      title: const Text(
                        'Cultura',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.add),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.fotoHoy);
                      },
                      title: const Text(
                        'Foto de Hoy',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.camera_alt),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.foro);
                      },
                      title: const Text(
                        'Foros',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.forum),
                    ),
                    ListTile(
                      onTap: () {
                        LaunchNavigator().lanzarNavegador(Urls.deporte);
                      },
                      title: const Text(
                        'Deportes',
                        style: TextStyles.drawerTiles,
                      ),
                      leading: const Icon(Icons.sports_basketball_sharp),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
