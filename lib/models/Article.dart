import 'package:intl/intl.dart';

class Article {
  final String nombreFuente,
      autor,
      titulo,
      descripcion,
      url,
      urlImagen,
      contenido;
  final List<String> categorias;
  final DateTime? fechaPublicacion;
  const Article({
    required this.categorias,
    required this.nombreFuente,
    required this.autor,
    required this.titulo,
    required this.descripcion,
    required this.url,
    required this.urlImagen,
    required this.fechaPublicacion,
    required this.contenido,
  });
  String? getFirstCategory() {
    return categorias.firstOrNull;
  }

  String? getTimeAgo() {
    final DateTime now = DateTime.now();

    // Si la fecha de publicación es posterior a 'now', usa 'now' como fecha de referencia
    final DateTime fechaComparacion =
        fechaPublicacion!.isAfter(now) ? now : fechaPublicacion!;

    final Duration difference = now.difference(fechaComparacion);

    if (difference.inMinutes <= 0) {
      return 'Recientemente';
    } else if (difference.inMinutes <= 59) {
      return 'Hace ${difference.inMinutes} ${difference.inMinutes == 1 ? 'minuto' : 'minutos'}';
    } else if (difference.inHours <= 23) {
      return 'Hace ${difference.inHours} ${difference.inHours == 1 ? 'hora' : 'horas'}';
    } else if (difference.inDays <= 6) {
      return 'Hace ${difference.inDays} ${difference.inDays == 1 ? 'día' : 'días'}';
    } else if (difference.inDays <= 30) {
      final inWeeks = (difference.inDays / 7).floor();
      return 'Hace $inWeeks ${inWeeks == 1 ? 'semana' : 'semanas'}';
    } else if (difference.inDays <= 365) {
      final inMonths = (difference.inDays / 30).floor();
      return 'Hace $inMonths ${inMonths == 1 ? 'mes' : 'meses'}';
    } else {
      final inYears = (difference.inDays / 365).floor();
      return 'Hace $inYears ${inYears == 1 ? 'año' : 'años'}';
    }
  }

  String? getFormatedFechaPublicacion() {
    String fechaFormateada =
        DateFormat('MMM dd yyyy', 'es').format(fechaPublicacion!);
    fechaFormateada = fechaFormateada.replaceFirst(
      fechaFormateada[0],
      fechaFormateada[0].toUpperCase(),
    );
    return fechaFormateada;
  }

  String getCategories() {
    if (categorias == null || categorias.isEmpty) {
      return 'Sin categorías';
    }

    return categorias.map((category) {
      if (category.isNotEmpty) {
        return '${category[0].toUpperCase()}${category.substring(1).toLowerCase()}';
      } else {
        return '';
      }
    }).join(', ');
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    List<String> categoryList = [];
    if (json['categories'] is List) {
      for (dynamic category in json['categories']) {
        if (category is String) {
          categoryList.add(category);
        }
      }
    }
    return Article(
        nombreFuente: json['source']['name'] ?? 'undefined',
        autor: json['author'] ?? '',
        titulo: json['title'] ?? '',
        descripcion: json['description'] ?? '',
        url: json['url'] ?? '',
        urlImagen: json['urlToImage'] == false ? '' : json['urlToImage'],
        fechaPublicacion: DateTime.parse(json['publishedAt']),
        contenido: json['content'] ?? '',
        categorias: categoryList);
  }
}
