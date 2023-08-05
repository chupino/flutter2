// ignore: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyles {
  static const TextStyle loginTitle = TextStyle(
      fontFamily: 'Poppins', fontSize: 38, fontWeight: FontWeight.bold);
  static const TextStyle loginSubtitle =
      TextStyle(fontFamily: 'Poppins', fontSize: 20);
  static const TextStyle sectionTitle =
      TextStyle(fontFamily: 'Poppins', fontSize: 30);

  static const TextStyle sectionSubtitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
  );

  static const TextStyle sectionMessage = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
  );

  static const TextStyle listTileTitle =
      TextStyle(fontFamily: 'Poppins', fontSize: 18);

  static const TextStyle listTileSubtitle =
      TextStyle(fontFamily: 'Poppins', fontSize: 15);

  static const TextStyle modalTitle = TextStyle(
      fontFamily: 'Poppins', fontSize: 25, fontWeight: FontWeight.bold);

  static TextStyle modalSubtitle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      color: Get.theme.bottomSheetTheme.shadowColor);

  static TextStyle hintText = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15,
      color: Get.theme.bottomSheetTheme.shadowColor);

  static TextStyle textButtons = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: Get.theme.bottomSheetTheme.shadowColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);
}
