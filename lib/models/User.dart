class User {
  final String nombre, apellido, correo, contrasenia, id;

  final bool isPremium;
  const User(
      {required this.id,
      required this.nombre,
      required this.apellido,
      required this.correo,
      required this.contrasenia,
      required this.isPremium});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        nombre: json['nombre'],
        apellido: json['apellido'],
        correo: json['correo'],
        contrasenia: json['contrasenia'],
        // ignore: unrelated_type_equality_checks
        isPremium: json['isPremium'].toString().toLowerCase() == 'true');
  }
}
