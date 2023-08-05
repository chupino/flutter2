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
    void enviarMensajeWhatsApp(String mensaje) async {
    const String telefono = '51961811703'; // Número de teléfono de destino

    // El enlace de WhatsApp debe comenzar con "whatsapp://send?phone="
    final String url =
        'whatsapp://send?phone=$telefono&text=${Uri.encodeFull(mensaje)}';
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }
}