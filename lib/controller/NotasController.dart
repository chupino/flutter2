import 'dart:convert';
import 'package:diario_el_pueblo/models/Article.dart';
import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotasController extends GetxController {
  Future<List<Article>> getNotas(int dummy) async {
    try {
      final url = Urls.noticiasAPI;
      Uri urlUri = Uri.parse(url);

      final response = await http.get(urlUri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List<Article> notas =
            data.map<Article>((element) => Article.fromJson(element)).toList();
        return notas;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Ocurrió un error al obtener las notas : $e');
    }
  }

  Future<Map> getNota({required int index}) async {
    Uri urlUri = Uri.parse(Urls.noticiasAPI);
    final response = await http.get(urlUri);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var articles = data as List;

      List article = articles
          .map((e) => {
                "title": e["title"],
                "image": e["urlToImage"],
                "autor": e["author"],
                "description": e["description"],
                "content": e["content"],
                "date": e["publishedAt"],
              })
          .toList();
      Map articleSelected = article[index];
      String dateString = articleSelected["date"];
      DateTime date = DateTime.parse(dateString);
      String dayName = DateFormat.EEEE("es").format(date);
      String monthName = DateFormat.MMMM("es").format(date);
      String formattedDate =
          "$dayName ${date.day} de $monthName del ${date.year}";

      articleSelected["date"] = formattedDate;
      return articleSelected;
    } else {
      return {};
    }
  }
}
