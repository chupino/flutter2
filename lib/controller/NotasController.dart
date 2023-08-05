import 'dart:convert';
import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotasController extends GetxController {
  Future<List> getNotas() async {
    final url = Urls.noticiasAPI;
    Uri urlUri = Uri.parse(url);

    final response = await http.get(urlUri);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var articles = data as List;
      var titles = articles
          .map((e) => {
                "title": e["title"],
                "image": e["urlToImage"],
                "author": e["author"],
              })
          .toList();
      return titles;
    } else {
      return [];
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
