// ignore: file_names
import 'package:diario_el_pueblo/components/AccessDeniedComponents/NoAccountNoPremiumModal.dart';
import 'package:diario_el_pueblo/components/AccessDeniedComponents/NoPremiumModal.dart';
import 'package:diario_el_pueblo/components/EdicionImpresaComponents/PdfViewer.dart';
import 'package:diario_el_pueblo/controller/SessionController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class EdicionImpresaScheme extends StatelessWidget {
  final TabController tabController;
  const EdicionImpresaScheme({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SessionController());
    return FutureBuilder(
      future: controller.checkSession(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          final isLogged = snapshot.data![0];
          final isPremium = snapshot.data![1];
          if (isLogged == true) {
            if (isPremium == true) {
              return const PdfViewerOnline();
            } else {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                NoPremiumModal(context: context, tabController: tabController)
                    .openModal();
              });
              return const PdfViewerOnline();
            }
          } else {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              NoAccountNoPremiumModal(context: context, tabController: tabController)
                  .openModal();
            });
            return const PdfViewerOnline();
          }
        } else {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
      },
    );
  }
}
