import 'package:diario_el_pueblo/components/DownloadComponents/Downloads.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';

class DownloadScheme extends StatelessWidget {
  const DownloadScheme({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Descargas",
              style: TextStyles.sectionTitle,
              textAlign: TextAlign.left,
            ),
            const Divider(),
            Expanded(
              child: DownloadsBuilder(
                size: size,
              ),
            ),
          ]),
    );
  }
}
