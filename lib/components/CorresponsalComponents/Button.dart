import 'package:diario_el_pueblo/core/helpers/ImageHelper.dart';
import 'package:diario_el_pueblo/core/helpers/LaunchNavigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonSendCorresponsal extends StatelessWidget {
  final TextEditingController controller;
  const ButtonSendCorresponsal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.text != "") {
          LaunchNavigator().enviarMensajeWhatsApp(controller.text);
        } else {
          Get.snackbar(
              backgroundColor: Get.theme.snackBarTheme.backgroundColor,
              snackPosition: SnackPosition.BOTTOM,
              'Campo Incompleto',
              'Escribe un mensaje');
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            height: 50,
            ImageHelper.selloBlanco,
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            'Enviar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
