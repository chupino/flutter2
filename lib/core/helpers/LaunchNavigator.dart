import 'package:url_launcher/url_launcher.dart';

class LaunchNavigator{
  void lanzarNavegador(String url) async {
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