import 'package:diario_el_pueblo/components/NotaDetailsComponents/DotSeparator.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class NotaDetailsScheme extends StatelessWidget {
  final Article article;
  const NotaDetailsScheme({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RichText(
              text: TextSpan(
                  text: article.nombreFuente,
                  style: TextStyles.notaDetailsMetaData,
                  children: [
                const TextSpan(text: ' · ', style: TextStyles.dotSeparator),
                TextSpan(
                  text: article.getFormatedFechaPublicacion()!,
                  style: TextStyles.notaDetailsMetaData,
                ),
                const TextSpan(text: ' · ', style: TextStyles.dotSeparator),
                TextSpan(
                  text: article.getCategories(),
                  style: TextStyles.notaDetailsMetaData,
                )
              ])),
          const SizedBox(
            height: 15,
          ),
          Text(
            article.titulo,
            style: TextStyles.notaDetailsTitle,
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(article.urlImagen)),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Get.theme.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              'Redactado por: ${article.autor}',
              style: TextStyles.notaDetailsAuthor,
              overflow: TextOverflow.clip,
            ),
          ),
          Html(
            data: article.contenido,
            style: {
              'p': TextStyles.notaDetailsContentParragraphs,
              'h5': TextStyles.notaDetailsContentH5
            },
          )
        ],
      ),
    );
    /*  return Column(
      children: [
        Image.network(article.urlImagen),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          alignment: Alignment.bottomLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                article.autor,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                article.getFormatedFechaPublicacion() ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              Text(
                article.titulo,
                style: const TextStyle(
                    fontSize: 50 / 1.618,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Georgia"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.descripcion,
                style: const TextStyle(
                    fontSize: 30.902 / 1.618,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Georgia"),
              ),
              const SizedBox(
                height: 7,
              ),
              Html(
                data: article.contenido,
              )
            ],
          ),
        )
      ],
    ); */
  }
}
