import 'package:diario_el_pueblo/controller/SessionController.dart';
import 'package:diario_el_pueblo/pages/details/noticiaDetails.dart';
import 'package:diario_el_pueblo/pages/login/login.dart';
import 'package:diario_el_pueblo/pages/login/loginInitial.dart';
import 'package:diario_el_pueblo/pages/navBar/navBar.dart';
import 'package:diario_el_pueblo/pages/pdfViewer/pdfViewer.dart';
import 'package:diario_el_pueblo/pages/settings/account.dart';
import 'package:diario_el_pueblo/pages/settings/favs.dart';
import 'package:diario_el_pueblo/pages/settings/switchTheme.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage<dynamic>> pagesRoutes = [
    GetPage(name: '/home', page: () => const NavBar()),
    GetPage(name: '/notaDetails', page: () => const NoticiasDetails()),
    GetPage(name: '/pdfViewer', page: () => const PdfViewer()),
    GetPage(name: '/switchTheme', page: () => const SwitchThemePage()),
    GetPage(name: '/favsPage', page: () => const FavsPage()),
    GetPage(name: '/accountPage', page: () => const AccountPage()),
    GetPage(name: '/login', page: () => const LoginPage()),
    GetPage(name: '/initialLogin', page: () => const LoginInitialPage()),
  ];

  static Future<String> getInitialRoute() async {
    final controller = Get.put(SessionController());
    final skipLogin = await controller.showInitialLogin();
    return skipLogin?'/home':'/initialLogin';
  }
}
