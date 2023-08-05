import 'package:diario_el_pueblo/components/LoginComponents/LoginScheme.dart';
import 'package:diario_el_pueblo/core/constants/LightColorPalette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          elevation: 0,
          backgroundColor: LightColorPalette().loginBackgroundColor),
      body: const LoginScheme(),
    );
  }
}
