class Genre {
  final String titulo, imagenUrl, url;
  const Genre(
      {required this.titulo, required this.imagenUrl, required this.url});
  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
        titulo: json['titulo'],
        imagenUrl: json['imagenURL'],
        url: json['goTo']);
  }
}
