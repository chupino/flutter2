import 'dart:convert';
import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

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
}
