import 'package:diario_el_pueblo/components/ContratarAnuncioComponents/Message.dart';
import 'package:diario_el_pueblo/core/helpers/LaunchNavigator.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:flutter/material.dart';

class ForoScheme extends StatelessWidget {
  const ForoScheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Visita nuestro Foro",
              style: TextStyles.sectionTitle,
              textAlign: TextAlign.left,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            MessageAnuncio(
              title: '¿Interesado en dar tu opinion?',
              content:
                  'Brinda tu opinión con los demas en el foro oficial del diario El Pueblo',
              sendText: 'Ir al foro',
              send: () {
                LaunchNavigator().lanzarNavegador(Urls.foro);
              },
              mainAxisAlignmentSend: MainAxisAlignment.center,
              separationSend: 10,
            )
          ]),
    );
  }
}
