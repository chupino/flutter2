import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageCorresponsal extends StatelessWidget {
  final TextEditingController controller;
  const MessageCorresponsal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:
              BorderSide(color: Get.theme.focusColor), // Agrega esta línea
        ),
        fillColor: Get.theme.listTileTheme.tileColor!.withOpacity(0.9),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        hintText: 'Envia un mensaje',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      maxLines: null,
    );
  }
}
