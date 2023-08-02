import 'package:diario_el_pueblo/pages/navBar/navBar.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage<dynamic>> pagesRoutes = [
    GetPage(name: '/home', page: () => const NavBar())
  ];

  static String getInitialRoute() {
    return '/home';
  }
}
