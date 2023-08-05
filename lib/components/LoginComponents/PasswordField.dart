import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordFieldLogin extends StatefulWidget {
  final String hintText;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  const PasswordFieldLogin(
      {super.key, required this.hintText, required this.formKey, required this.controller});

  @override
  State<PasswordFieldLogin> createState() => _PasswordFieldLoginState();
}

class _PasswordFieldLoginState extends State<PasswordFieldLogin> {
  bool hidePassword = true;
  void togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

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
              controller: widget.controller,
              obscureText: hidePassword,
              onChanged: (value) {
                widget.formKey.currentState!.validate();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Completa la información';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    focusColor: Get.theme.focusColor,
                    onPressed: () {
                      togglePasswordVisibility();
                      print(hidePassword);
                    },
                    icon: hidePassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyles.hintText,
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
