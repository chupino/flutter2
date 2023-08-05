import 'package:diario_el_pueblo/components/FavsComponents/FavsScheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavsPage extends StatelessWidget {
  const FavsPage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                iconTheme: const IconThemeData(size: 40),
                title: Image.asset('assets/images/logo_blanco.png'),
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
          body: const FavsScheme()),
    );
  }
}