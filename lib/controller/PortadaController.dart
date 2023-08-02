import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:http/http.dart' as http;

class PortadaController extends GetxController {
  Future<Uint8List> getThumbnail() async {
    final prefs = await SharedPreferences.getInstance();
    tz.initializeTimeZones();
    var lima = getLocation("America/Lima");
    var now = TZDateTime.now(lima);
    DateFormat format = DateFormat("dd-MM-yyyy");
    String fechaFormateada = format.format(now);
    String mes = now.month.toString().padLeft(2, '0');
    String anio = now.year.toString();
    print(now);
    print(fechaFormateada);
    if (now.hour > 6 || now.hour == 6 && now.minute >= 0) {
      print("nuevo diario ya!");
      final response2 = await http.get(Uri.parse(
          "https://diarioelpueblo.com.pe/wp-content/uploads/$anio/$mes/$fechaFormateada.jpg"));
      print(
          "https://diarioelpueblo.com.pe/wp-content/uploads/$anio/$mes/$fechaFormateada.jpg");
      print(response2.headers['content-type']);
      if (response2.headers['content-type'] == "image/jpeg") {
        final Uint8List bytes = response2.bodyBytes;
        String encodedData = base64Encode(bytes);
        Map<String, dynamic> datos = {
          "fecha": fechaFormateada,
          "bytes": encodedData
        };
        String datosString = json.encode(datos);
        await prefs.setString("datosThumbnail", datosString);
        return bytes;
      } else {
        print("no era");
        DateTime fechaPasada = now.subtract(Duration(days: 1));
        String fechaFormateadaPasada = format.format(fechaPasada);
        print(fechaFormateadaPasada);
        String mesPasado = fechaPasada.month.toString().padLeft(2, '0');
        String anioPasado = fechaPasada.year.toString();

        final response2 = await http.get(Uri.parse(
            "https://diarioelpueblo.com.pe/wp-content/uploads/$anioPasado/$mesPasado/$fechaFormateadaPasada.jpg"));
        final Uint8List bytes = response2.bodyBytes;

        String encodedData = base64Encode(bytes);
        Map<String, dynamic> datos = {
          "fecha": fechaFormateadaPasada,
          "bytes": encodedData
        };
        String datosString = json.encode(datos);
        await prefs.setString("datosThumbnail", datosString);
        return bytes;
      }
    } else {
      print("nos quedamos con el que tenemos");
      DateTime fechaPasada = now.subtract(Duration(days: 1));
      String fechaFormateadaPasada = format.format(fechaPasada);
      String mesPasado = fechaPasada.month.toString().padLeft(2, '0');
      ;
      String anioPasado = fechaPasada.year.toString();

      http.Response response2 = await http.get(Uri.parse(
          "https://diarioelpueblo.com.pe/wp-content/uploads/$anioPasado/$mesPasado/$fechaFormateadaPasada.jpg"));

      while (response2.headers['content-type'] != "image/jpeg") {
        fechaPasada = fechaPasada.subtract(Duration(days: 1));
        fechaFormateadaPasada = format.format(fechaPasada);
        mesPasado = fechaPasada.month.toString().padLeft(2, '0');
        ;
        anioPasado = fechaPasada.year.toString();
        response2 = await http.get(Uri.parse(
            "https://diarioelpueblo.com.pe/wp-content/uploads/$anioPasado/$mesPasado/$fechaFormateadaPasada.jpg"));
        print(fechaPasada);
      }
      final Uint8List bytes = response2.bodyBytes;

      String encodedData = base64Encode(bytes);
      Map<String, dynamic> datos = {
        "fecha": fechaFormateadaPasada,
        "bytes": encodedData
      };
      String datosString = json.encode(datos);
      await prefs.setString("datosThumbnail", datosString);
      return bytes;
    }
  }
}
