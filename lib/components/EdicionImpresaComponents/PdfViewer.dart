import 'package:diario_el_pueblo/controller/PdfController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerOnline extends StatefulWidget {
  const PdfViewerOnline({super.key});

  @override
  State<PdfViewerOnline> createState() => _PdfViewerOnlineState();
}

class _PdfViewerOnlineState extends State<PdfViewerOnline> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PdfController());
    PdfViewerController pdfViewerController = PdfViewerController();
    return FutureBuilder(
      future: controller.getPdfBytes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: Get.theme.primaryColor.withOpacity(0.2),
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                        onPressed: () {
                          pdfViewerController.zoomLevel =
                              pdfViewerController.zoomLevel + 0.5;
                        },
                        icon: const Icon(Icons.zoom_in)),
                    IconButton(
                        onPressed: () {
                          pdfViewerController.zoomLevel =
                              pdfViewerController.zoomLevel - 0.5;
                        },
                        icon: const Icon(Icons.zoom_out)),
                    IconButton(
                        onPressed: () {
                          Get.snackbar(
                              backgroundColor:
                                  Get.theme.snackBarTheme.backgroundColor,
                              snackPosition: SnackPosition.BOTTOM,
                              "Descargando...",
                              "Su documento esta descargándose");
                          controller
                              .savePdf()
                              .then((value) => Get.snackbar(
                                  backgroundColor:
                                      Get.theme.snackBarTheme.backgroundColor,
                                  snackPosition: SnackPosition.BOTTOM,
                                  "Descarga Finalizada",
                                  "Ahora puede ver su documento en la seccion 'Descargas'"))
                              .catchError((e) => Get.snackbar(
                                  backgroundColor:
                                      Get.theme.snackBarTheme.backgroundColor,
                                  snackPosition: SnackPosition.BOTTOM,
                                  "Error",
                                  "No se pudo completar la acción"));
                        },
                        icon: const Icon(Icons.download))
                  ]),
              body: SfPdfViewer.memory(
                snapshot.data!,
                controller: pdfViewerController,
              ),
            );
          } else {
            return const Text("No se pudo cargar");
          }
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }
}
