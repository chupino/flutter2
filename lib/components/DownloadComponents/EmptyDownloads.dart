import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyDownload extends StatelessWidget {
  final Size size;
  const EmptyDownload({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/animations/downloads_empty.json',
                ),
                const Text(
                  'No tienes contenido descargado',
                  style: TextStyles.sectionMessage,
                  textAlign: TextAlign.center,
                )
              ],
            )));
  }
}
