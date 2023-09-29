import 'package:diario_el_pueblo/components/ExploreComponents/Cards.dart';
import 'package:diario_el_pueblo/components/ExploreComponents/CardsAlternative.dart';
import 'package:diario_el_pueblo/controller/SearchController.dart';
import 'package:diario_el_pueblo/models/Genre.dart';
import 'package:diario_el_pueblo/utils/Genres.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenresExplore extends StatelessWidget {
  const GenresExplore({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExploreController());
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: SingleChildScrollView(
        child: Column(
            children: GenresNews()
                .tags
                .map((element) =>
                    CardGenreExplore(genre: Genre.fromJson(element)))
                .toList()),
      ),
    );
  }
}
