import 'package:diario_el_pueblo/components/DownloadComponents/EmptyDownloads.dart';
import 'package:diario_el_pueblo/components/DownloadComponents/MoreModal.dart';
import 'package:diario_el_pueblo/controller/DownloadController.dart';
import 'package:diario_el_pueblo/core/helpers/ImageHelper.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as pa;

class DownloadsBuilder extends StatelessWidget {
  final Size size;
  const DownloadsBuilder({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DownloadController());
    return FutureBuilder(
      future: controller.getFiles(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data);

          if (snapshot.data!.isNotEmpty) {
            return Wrap(
              children: snapshot.data!
                  .map((e) => ListTile(
                      onLongPress: () {
                        MoreModal(context: context, path: e.path).openModal();
                      },
                      onTap: () {
                        Get.toNamed('/pdfViewer', arguments: e.path);
                      },
                      title: const Text(
                        'EDICION IMPRESA',
                        style: TextStyles.listTileTitle,
                      ),
                      subtitle: Text(
                        pa.basenameWithoutExtension(e.path),
                        style: TextStyles.listTileSubtitle,
                      ),
                      leading: Image.asset(
                        ImageHelper.selloBlanco,
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            MoreModal(context: context, path: e.path)
                                .openModal();
                          },
                          icon: const Icon(Icons.more_vert))))
                  .toList(),
            );
          } else {
            return EmptyDownload(size: size);
          }
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }
}
