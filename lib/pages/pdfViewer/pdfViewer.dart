import 'package:diario_el_pueblo/components/PdfViewerComponents/PdfViewerBuilder.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  final arguments = Get.arguments;
  @override
  Widget build(BuildContext context) {
    PdfViewerController pdfViewerController = PdfViewerController();
    return Scaffold(
      body: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                iconTheme: const IconThemeData(size: 50),
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                title: Image.asset('assets/images/logo_blanco.png'),
                pinned: true,
              ),
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                primary: false,
                actions: [
                  IconButton(
                      onPressed: () {
                        pdfViewerController.zoomLevel += 0.5;
                      },
                      icon: const Icon(Icons.zoom_in)),
                  IconButton(
                      onPressed: () {
                        pdfViewerController.zoomLevel -= 0.5;
                      },
                      icon: const Icon(Icons.zoom_out))
                ],
              ),
            ];
          },
          body: PdfViewerBuilder(
              path: arguments, pdfViewerController: pdfViewerController)),
    );
  }
}
