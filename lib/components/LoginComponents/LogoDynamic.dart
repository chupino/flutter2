import 'package:diario_el_pueblo/core/helpers/ImageHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoDynamic extends StatelessWidget {
  const LogoDynamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Get.isDarkMode?Image.asset(ImageHelper.logoBlanco):Image.asset(ImageHelper.logoNegro);
  }
}