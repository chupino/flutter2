import 'package:diario_el_pueblo/components/LoginComponents/Button.dart';
import 'package:diario_el_pueblo/components/LoginComponents/LogoDynamic.dart';
import 'package:diario_el_pueblo/components/LoginComponents/PasswordField.dart';
import 'package:diario_el_pueblo/components/LoginComponents/TextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSection extends StatelessWidget {
  const LoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formKeyEmail = GlobalKey<FormState>();
    final formKeyPassword = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
          color: Get.theme.canvasColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60))),
      child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const LogoDynamic(),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: formKeyEmail,
                  child: TextFieldLogin(
                    controller: emailController,
                    hintText: 'Correo',
                    formKey: formKeyEmail,
                  )),
              const SizedBox(
                height: 10,
              ),
              Form(
                  key: formKeyPassword,
                  child: PasswordFieldLogin(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    formKey: formKeyPassword,
                  )),
              const SizedBox(
                height: 20,
              ),
              ButtonLogin(
                emailKey: formKeyEmail,
                passwordKey: formKeyPassword,
                emailController: emailController,
                passwordController: passwordController,
              ),
            ],
          )),
    );
  }
}
