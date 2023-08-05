import 'package:diario_el_pueblo/utils/Routes.dart';
import 'package:diario_el_pueblo/utils/Themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Routes.getInitialRoute(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GetMaterialApp(
              title: 'Diario el Pueblo',
              theme: Themes().lightTheme,
              darkTheme: Themes().darkTheme,
              themeMode: ThemeMode.system,
              debugShowCheckedModeBanner: false,
              initialRoute: snapshot.data,
              getPages: Routes.pagesRoutes,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
