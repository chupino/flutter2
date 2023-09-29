import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as cy;
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class DownloadController extends GetxController {


  Future<List<FileSystemEntity>> getFiles() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = await directory.list().toList();
    return files.where((file) => file.path.endsWith('.pdf')).toList();
  }

  Future<Uint8List> loadAndDecryptPDF({required String path}) async {
    final key = cy.Key.fromUtf8('my 32 length keymy 32 length key');
    final iv = cy.IV.fromLength(16);
    final encrypter = cy.Encrypter(cy.AES(key));

    final encryptedData = await File(path).readAsBytes();
    final decryptedData =
        encrypter.decryptBytes(cy.Encrypted(encryptedData), iv: iv);

    return Uint8List.fromList(decryptedData);
  }

  Future<void> deletePdf(String path) async {
    final File pdf = File(path);
    await pdf.delete();
  }
}
