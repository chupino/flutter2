import 'package:diario_el_pueblo/pages/home/home.dart';
import 'package:diario_el_pueblo/utils/Routes.dart';
import 'package:diario_el_pueblo/utils/Themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Diario el Pueblo',
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.getInitialRoute(),
      getPages: Routes.pagesRoutes,
    );
  }
}


