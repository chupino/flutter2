import 'package:diario_el_pueblo/components/SwitchThemeComponents/SwitchThemeScheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchThemePage extends StatelessWidget {
  const SwitchThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                title: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Image.asset('assets/images/logo_blanco.png'),
                ),
                automaticallyImplyLeading: false,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                pinned: true,
              ),
            ];
          },
          body: const SwitchThemeScheme()),
    );
  }
}
