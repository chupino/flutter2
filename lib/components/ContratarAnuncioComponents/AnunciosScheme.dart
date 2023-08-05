import 'package:diario_el_pueblo/components/ContratarAnuncioComponents/Message.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
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
      child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Contratar un anuncio",
              style: TextStyles.sectionTitle,
              textAlign: TextAlign.left,
            ),
            Divider(),
            SizedBox(height: 10,),
            MessageAnuncio()
          ]),
    );
  }
}
