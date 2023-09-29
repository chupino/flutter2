import 'package:cached_network_image/cached_network_image.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class NotaHome extends StatelessWidget {
  final Article article;
  const NotaHome({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed('/notaDetails', arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.4,
                height: size.width * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    loadingBuilder: (context, child, loadingProgress) {
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

                        return Padding(
                          padding: const EdgeInsets.all(50.0),
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
                                    color:
                                        Get.theme.progressIndicatorTheme.color,
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
                    article.urlImagen,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image);
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      children: [
                        Text(
                          article.autor,
                          style: TextStyles.notaAuthor,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text('·', style: TextStyles.dotSeparator),
                        ),
                        Text(
                          article.getFirstCategory() ?? '',
                          style: TextStyles.notaTags,
                        )
                      ],
                    ),
                    const SizedBox(height: 7),
                    Text(
                      article.titulo,
                      style: TextStyles.notaTitle,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      article.getTimeAgo() ?? '',
                      style: TextStyles.notaTimeAgo,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      article.getFormatedFechaPublicacion() ?? '',
                      style: TextStyles.notaDate,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    /* return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width - 20,
        child: ListTile(
            title: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                article.titulo,
                style: const TextStyle(fontFamily: "Georgia", fontSize: 20),
              ),
            ),
            leading: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: double.maxFinite,
                child: CachedNetworkImage(
                  imageUrl: article.urlImagen,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.black12,
                    child: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                )),
            subtitle: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(article.autor),
            ))); */
  }
}
