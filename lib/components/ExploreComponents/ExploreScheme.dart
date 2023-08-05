import 'package:diario_el_pueblo/components/ExploreComponents/Genres.dart';
import 'package:diario_el_pueblo/components/ExploreComponents/SearchBox.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';

class ExploreScheme extends StatelessWidget {
  const ExploreScheme({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Explorar",
              style: TextStyles.sectionTitle,
              textAlign: TextAlign.left,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            SearchBox(),
            SizedBox(
              height: 15,
            ),
            GenresExplore()
          ],
        ),
      ),
    );
  }
}
