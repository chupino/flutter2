import 'package:diario_el_pueblo/controller/DownloadController.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MoreModal {
  BuildContext context;
  String path;
  Function callback;
  final controller = Get.put(DownloadController());
  MoreModal(
      {required this.callback, required this.path, required this.context});
  Future<void> openModal() async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Acciones',
                style: TextStyles.modalTitle,
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Get.toNamed('/pdfViewer', arguments: path);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.readme),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Ver',
                        style: TextStyles.modalSubtitle,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.deletePdf(path).then((value) {
                    Navigator.pop(context);
                    callback();
                    Get.snackbar(
                        backgroundColor:
                            Get.theme.snackBarTheme.backgroundColor,
                        snackPosition: SnackPosition.BOTTOM,
                        'Eliminado',
                        'Se ha eliminado el documento correctamente');
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.trash),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Eliminar',
                        style: TextStyles.modalSubtitle,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
