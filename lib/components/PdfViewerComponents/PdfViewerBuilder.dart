import 'dart:typed_data';

import 'package:diario_el_pueblo/controller/DownloadController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerBuilder extends StatefulWidget {
  final String path;
  final PdfViewerController pdfViewerController;
  const PdfViewerBuilder({super.key, required this.path, required this.pdfViewerController});

  @override
  State<PdfViewerBuilder> createState() => _PdfViewerBuilderState();
}

class _PdfViewerBuilderState extends State<PdfViewerBuilder> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DownloadController());
    return FutureBuilder<Uint8List>(
      future: controller.loadAndDecryptPDF(path: widget.path),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            //child: Text('Error: ${snapshot.error}'),
            child: Text("Descifrado Incorrecto, compruebe la licencia"),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('No se encontraron datos'),
          );
        } else {
          return SfPdfViewer.memory(
            snapshot.data!,
            controller: widget.pdfViewerController,
          );
        }
      },
    );
  }
}
