import 'package:diario_el_pueblo/components/ContratarAnuncioComponents/Message.dart';
import 'package:diario_el_pueblo/core/helpers/LaunchNavigator.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:flutter/material.dart';

class AnunciosScheme extends StatefulWidget {
  const AnunciosScheme({super.key});

  @override
  State<AnunciosScheme> createState() => _AnunciosSchemeState();
}

class _AnunciosSchemeState extends State<AnunciosScheme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Contratar un anuncio",
              style: TextStyles.sectionTitle,
              textAlign: TextAlign.left,
            ),
            const Divider(),
            const SizedBox(height: 10,),
            MessageAnuncio(
              title: '¿Quieres dar a conocer algo?',
              content: 'Al contratar un anuncio, podrás llegar a más personas y aumentar tus ventas. ¡No pierdas esta oportunidad!',
              sendText: 'Publica un anuncio ya!',
              send: () {
              LaunchNavigator().lanzarNavegador(Urls.formAnuncio);
            },
            )
          ]),
    );
  }
}
