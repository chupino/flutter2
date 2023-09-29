import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FirstNota extends StatelessWidget {
  final Article article;
  const FirstNota({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/notaDetails', arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              children: [
                Center(
                  child:
                      Image.network(errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.image,
                      size: 50,
                    );
                  }, loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      // No se ha iniciado la carga, muestra el child
                      return child;
                    }

                    final cumulativeBytesLoaded =
                        loadingProgress.cumulativeBytesLoaded ?? 0;
                    final expectedTotalBytes =
                        loadingProgress.expectedTotalBytes ?? 100;

                    if (expectedTotalBytes != 0) {
                      final progress =
                          cumulativeBytesLoaded / expectedTotalBytes;

                      return SizedBox(
                        width: 150,
                        height: 150,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 100,
                              startAngle: 270,
                              endAngle: 270,
                              showLabels: false,
                              showTicks: false,
                              axisLineStyle: const AxisLineStyle(thickness: 0),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  value: progress *
                                      100, // Valor del progreso en el rango de 0 a 100
                                  width: 0.95,
                                  color: Get.theme.progressIndicatorTheme.color,
                                  pointerOffset: 0.05,
                                  sizeUnit: GaugeSizeUnit.factor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }, article.urlImagen),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            tileMode: TileMode.repeated,
                            stops: [0.0, 0.5, 0.85, 0.95, 1.0],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black45,
                              Colors.black12,
                              Colors.black26,
                              Colors.transparent
                            ])),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      article.titulo,
                      style: TextStyles.firstNotaTitle,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
