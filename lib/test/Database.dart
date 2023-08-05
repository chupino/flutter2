import 'package:diario_el_pueblo/test/Users.dart';

class Database {
  final List<dynamic> users = [
    Users.user1,
    Users.user2,
  ];

  Map<String, dynamic> getUserById({required String id}) {
    return users.firstWhere((element) => element['id'] == id);
  }

Future<Map<String, dynamic>> loginWithEmail(
    {required String email, required String password}) async {
  return await Future.delayed(Duration(seconds: 2), () {
    return users.firstWhere(
      (element) =>
          element['correo'] == email && element['contrasenia'] == password,
      orElse: () => <String, dynamic>{},
    );
  });
}

}
