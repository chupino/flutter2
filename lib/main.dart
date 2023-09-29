import 'package:diario_el_pueblo/utils/OneSignal.dart';
import 'package:diario_el_pueblo/utils/Routes.dart';
import 'package:diario_el_pueblo/utils/Themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting();
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OneSignalHelper().initialize();
  }

  Future<Map<String, dynamic>> getInitialRouteAndTheme() async {
    final String initialRoute = await Routes.getInitialRoute();
    final ThemeMode themeMode = await Themes.getTheme();
    return {'initialRoute': initialRoute, 'themeMode': themeMode};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getInitialRouteAndTheme(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final Map<String, dynamic> data =
              snapshot.data as Map<String, dynamic>;
          final String initialRoute = data['initialRoute'] as String;
          final ThemeMode themeMode = data['themeMode'] as ThemeMode;

          return GetMaterialApp(
            title: 'Diario el Pueblo',
            theme: Themes().lightTheme,
            darkTheme: Themes().darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: '/home',
            getPages: Routes.pagesRoutes,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
