import 'package:diario_el_pueblo/models/User.dart';
import 'package:diario_el_pueblo/test/Database.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionController extends GetxController {
  Future<bool> isLogged() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogged = prefs.getBool('isLogged') ?? false;
    return isLogged;
  }

  Future<bool> isPremium() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogged = prefs.getBool('isLogged') ?? false;
    if (isLogged) {
      final userId = prefs.getString('UID');
      final user = Database().getUserById(id: userId!);
      User currentUser = User.fromJson(user);
      return currentUser.isPremium;
    } else {
      return isLogged;
    }
  }

  Future<List> checkSession() async {
    final isUserPremium = await isPremium();
    final isUserLogged = await isLogged();

    return [isUserLogged, isUserPremium];
  }

  Future<void> intentLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final result =
        await Database().loginWithEmail(email: email, password: password);

    if (result.isNotEmpty) {
      final User user = User.fromJson(result);
      prefs.setBool('isLogged', true);
      prefs.setString('UID', user.id);
      Get.offAndToNamed('/home');
    } else {
      Get.snackbar(
        'Error',
        'Las credenciales no son correctas',
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    print(result);
  }

  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('UID') ?? '';

    final result = Database().getUserById(id: userId);

    if (result.isNotEmpty) {
      return User.fromJson(result);
    } else {
      return const User(
          id: '-',
          nombre: '-',
          apellido: '-',
          correo: '-',
          contrasenia: '-',
          isPremium: false);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogged', false);
    prefs.setString('UID', '');
    Get.offAndToNamed('/home');
  }

  Future<bool> showInitialLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('skipLogin')??false;
  }

  Future<void> skipLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('skipLogin', true);
    Get.offAndToNamed('/home');
  }
}
