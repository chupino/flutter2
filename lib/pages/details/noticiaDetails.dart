import 'package:diario_el_pueblo/components/NotaDetailsComponents/NotaDetailsScheme.dart';
import 'package:diario_el_pueblo/controller/NotasController.dart';
import 'package:diario_el_pueblo/models/Article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class NoticiasDetails extends StatefulWidget {
  const NoticiasDetails({super.key});

  @override
  State<NoticiasDetails> createState() => _NoticiasDetailsState();
}

class _NoticiasDetailsState extends State<NoticiasDetails> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotasController());
    final Article article = Get.arguments; //index
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Share.share(article.url);
                },
                icon: const Icon(Icons.share))
          ],
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body:
            SingleChildScrollView(child: NotaDetailsScheme(article: article)));
  }
}
