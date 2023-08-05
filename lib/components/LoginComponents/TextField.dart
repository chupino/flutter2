import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldLogin extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  const TextFieldLogin(
      {super.key, required this.hintText, required this.formKey, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                formKey.currentState!.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Completa la información';
                } /* else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Ingresa un correo electrónico válido';
                } */
                else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyles.hintText,
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
