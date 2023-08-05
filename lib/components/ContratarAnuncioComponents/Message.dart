import 'package:diario_el_pueblo/core/helpers/ImageHelper.dart';
import 'package:diario_el_pueblo/core/helpers/LaunchNavigator.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageAnuncio extends StatelessWidget {
  const MessageAnuncio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Get.theme.listTileTheme.tileColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              textAlign: TextAlign.center,
              '¿Quieres dar a conocer algo?',
              style: TextStyles.sectionSubtitle),
          const SizedBox(height: 16),
          const Text(
            'Al contratar un anuncio, podrás llegar a más personas y aumentar tus ventas. ¡No pierdas esta oportunidad!',
            style: TextStyles.sectionMessage,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              LaunchNavigator().lanzarNavegador(Urls.formAnuncio);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  height: 50,
                  ImageHelper.selloBlanco,
                ),
                const Text(
                  'Publica un anuncio ya!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
