import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ExploreController extends GetxController {
  Future<void> enviarPortalBusqueda({required String search}) async {
    final url = '${Urls.webSearch}$search';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),
          webViewConfiguration: WebViewConfiguration(
              enableJavaScript: true,
              enableDomStorage: true,
              headers: {"url": url}),
          mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir $url';
    }
  }
}
