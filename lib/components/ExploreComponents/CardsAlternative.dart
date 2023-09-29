import 'package:cached_network_image/cached_network_image.dart';
import 'package:diario_el_pueblo/core/helpers/LaunchNavigator.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/models/Article.dart';
import 'package:diario_el_pueblo/models/Genre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CardGenreExplore extends StatelessWidget {
  final Genre genre;
  const CardGenreExplore({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          LaunchNavigator().lanzarNavegador(genre.url);
        },
        child: SizedBox(
          height: size.height * 0.25,
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                        progressIndicatorBuilder:
                            (context, url, loadingProgress) {
                          final cumulativeBytesLoaded =
                              loadingProgress.downloaded ?? 0;
                          final expectedTotalBytes =
                              loadingProgress.totalSize ?? 100;

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
                                    axisLineStyle:
                                        const AxisLineStyle(thickness: 0),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        value: progress *
                                            100, // Valor del progreso en el rango de 0 a 100
                                        width: 0.95,
                                        color: Get
                                            .theme.progressIndicatorTheme.color,
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
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(
                            Icons.image,
                            size: 50,
                          );
                        },
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: genre.imagenUrl),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              tileMode: TileMode.repeated,
                              stops: [0.0, 0.77, 0.95, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black,
                                Colors.black45,
                                Colors.black26,
                                Colors.transparent
                              ])),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        genre.titulo,
                        style: TextStyles.genreCardTitle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
