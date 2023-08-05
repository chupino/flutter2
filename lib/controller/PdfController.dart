import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as cy;

class PdfController extends GetxController {
  Future<Uint8List> getPdfBytes() async {
    final prefs = await SharedPreferences.getInstance();
    final data = await prefs.getString("datosThumbnail")!;
    final dataDecode = json.decode(data);
    final fechaString = dataDecode["fecha"];
    DateFormat format = DateFormat("dd-MM-yyyy");
    DateTime ahora = DateFormat("dd-MM-yyyy").parse(fechaString);
    String ahoraString = format.format(ahora);
    String url =
        "https://diarioelpueblo.com.pe/wp-content/uploads/${ahora.year}/${ahora.month.toString().padLeft(2, '0')}/${ahoraString}.pdf";
    print(url);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Uint8List data = response.bodyBytes;
        print(data.runtimeType);
        return data;
      } else {
        throw "error200";
      }
    } catch (e) {
      throw "error";
    }
  }
  
  Future<void> savePdf() async {
    Uint8List bits = await getPdfBytes();
    DateTime now = DateTime.now();
    String dayName = DateFormat.EEEE("es").format(now);
    String monthName = DateFormat.MMMM("es").format(now);
    String formato = "$dayName ${now.day} de $monthName del ${now.year}";
    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/$formato.pdf");
    final key = cy.Key.fromUtf8('my 32 length keymy 32 length key');
    final iv = cy.IV.fromLength(16);
    final encrypter = cy.Encrypter(cy.AES(key));
    final encrypted = encrypter.encryptBytes(bits, iv: iv);
    final encryptedFilePath = file.path;
    final encryptedFile = File(encryptedFilePath);
    encryptedFile.writeAsBytesSync(encrypted.bytes);
  }
}
