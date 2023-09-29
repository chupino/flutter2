import 'package:cached_network_image/cached_network_image.dart';
import 'package:diario_el_pueblo/components/HomeComponents/ErrorLoading.dart';
import 'package:diario_el_pueblo/components/HomeComponents/FirstNota.dart';
import 'package:diario_el_pueblo/components/HomeComponents/Nota.dart';
import 'package:diario_el_pueblo/components/HomeComponents/NotaLoading.dart';
import 'package:diario_el_pueblo/controller/NotasController.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/models/Article.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class NotasHome extends StatefulWidget {
  const NotasHome({super.key});

  @override
  State<NotasHome> createState() => _NotasHomeState();
}

class _NotasHomeState extends State<NotasHome> {
  int dummy = 0;
  void refresh() {
    setState(() {
      dummy++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotasController());
    return FutureBuilder(
      future: controller.getNotas(dummy),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SingleChildScrollView(child: NotaLoading());
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
              child: ErrorLoading(
            message:
                'No se ha podido cargar las noticias, verifica tu conexión',
            refresh: refresh,
          ));
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<Article> dataList = snapshot.data!;

          List<Widget> widgetList = dataList.asMap().entries.map((entry) {
            int index = entry.key;
            if (index == 0) {
              return FirstNota(article: dataList[index]);
            } else {
              return Column(
                children: [NotaHome(article: dataList[index]), const Divider()],
              );
            }
          }).toList();

          return Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: widgetList,
                ),
              ),
            ),
          );
        }
        /* return Scrollbar(
            child: CustomScrollView(

              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('notaDetails',
                                    arguments: snapshot.data![index]);
                              },
                              child: FirstNota(
                                article: snapshot.data![index],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('notaDetails',
                                arguments: snapshot.data![index]);
                          },
                          child: Column(
                            children: [
                              NotaHome(
                                article: snapshot.data![index],
                              ),
                              const Divider()
                            ],
                          ),
                        );
                      }
                    },
                    childCount: snapshot.data!.length,
                  ),
                ),
              ],
            ),
          ); */
        else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }
}
