// ignore: file_names
import 'package:diario_el_pueblo/core/helpers/Fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class TextStyles {
  static const TextStyle optionsTile = TextStyle(
      fontFamily: FontsHelper.droidSerif, fontWeight: FontWeight.w500);
  static const TextStyle optionsSubtitle = TextStyle(
      fontFamily: FontsHelper.droidSerif, fontWeight: FontWeight.w400);
  static const TextStyle drawerTiles = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontWeight: FontWeight.w500,
      fontSize: 14);
  static const TextStyle drawerSections = TextStyle(
      fontSize: 12,
      fontFamily: FontsHelper.droidSerif,
      fontWeight: FontWeight.w100,
      color: Colors.grey);
  static const TextStyle navBarLabel = TextStyle(
      fontFamily: FontsHelper.droidSerif, fontWeight: FontWeight.bold);
  static const TextStyle tabsHome = TextStyle(
      fontFamily: FontsHelper.droidSerif, fontWeight: FontWeight.bold);
  static const TextStyle genreCardTitle = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: Colors.white);
  static const TextStyle firstNotaTitle = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 15,
      fontWeight: FontWeight.w800,
      color: Colors.white);
  static const TextStyle notaDetailsMetaData = TextStyle(
      color: Color.fromARGB(255, 28, 153, 33),
      fontFamily: FontsHelper.droidSerif,
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static const TextStyle notaDetailsTitle = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 30,
      fontWeight: FontWeight.w700);
  static Style notaDetailsContentParragraphs = Style(
      fontFamily: FontsHelper.droidSerif,
      fontSize: FontSize(15),
      fontWeight: FontWeight.w400);
  static Style notaDetailsContentH5 = Style(
      fontFamily: FontsHelper.droidSerif,
      fontSize: FontSize(12),
      fontWeight: FontWeight.w600);
  static const TextStyle notaDetailsAuthor = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 15,
      fontWeight: FontWeight.w200);
  static const TextStyle notaAuthor = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 10,
      fontWeight: FontWeight.w100);
  static const TextStyle dotSeparator = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static const TextStyle notaTags = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 10,
      fontWeight: FontWeight.w200);
  static const TextStyle notaTitle = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 20,
      fontWeight: FontWeight.bold);
  static const TextStyle notaTimeAgo = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 12,
      fontWeight: FontWeight.w200);
  static const TextStyle notaDate = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 10,
      fontWeight: FontWeight.w200);
  static const TextStyle loginTitle = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 38,
      fontWeight: FontWeight.bold);
  static const TextStyle loginSubtitle =
      TextStyle(fontFamily: FontsHelper.droidSerif, fontSize: 20);
  static const TextStyle sectionTitle =
      TextStyle(fontFamily: FontsHelper.droidSerif, fontSize: 30);

  static const TextStyle sectionSubtitle = TextStyle(
    fontFamily: FontsHelper.droidSerif,
    fontSize: 22,
  );

  static const TextStyle sectionMessage = TextStyle(
    fontFamily: FontsHelper.droidSerif,
    fontSize: 18,
  );

  static const TextStyle listTileTitle =
      TextStyle(fontFamily: FontsHelper.droidSerif, fontSize: 18);

  static const TextStyle listTileSubtitle =
      TextStyle(fontFamily: FontsHelper.droidSerif, fontSize: 15);

  static const TextStyle modalTitle = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 25,
      fontWeight: FontWeight.bold);

  static TextStyle modalSubtitle = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 18,
      color: Get.theme.bottomSheetTheme.shadowColor);

  static TextStyle hintText = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 15,
      color: Get.theme.bottomSheetTheme.shadowColor);

  static TextStyle textButtons = TextStyle(
      fontFamily: FontsHelper.droidSerif,
      fontSize: 20,
      color: Get.theme.bottomSheetTheme.shadowColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline);
}
