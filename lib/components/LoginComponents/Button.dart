import 'package:diario_el_pueblo/controller/SessionController.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ButtonLogin extends StatefulWidget {
  final GlobalKey<FormState> emailKey;
  final GlobalKey<FormState> passwordKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const ButtonLogin(
      {super.key,
      required this.emailKey,
      required this.passwordKey,
      required this.emailController,
      required this.passwordController});

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading ? _buildLoadingLoginButton() : _buildLoginButton();
  }

  Widget _buildLoadingLoginButton() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: width * 0.8,
      height: height * 0.075,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.1),
        ),
      ),
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {},
          child: Row(
            children: [
              Lottie.asset("assets/animations/loginLoading.json"),
              Text(
                'Autenticando...',
                style: TextStyles.modalSubtitle,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    final controller = Get.put(SessionController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: width * 0.8,
      height: height * 0.075,
      decoration: ShapeDecoration(
        color: Get.theme.canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.1),
        ),
      ),
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {
            bool emailCheck = widget.emailKey.currentState!.validate();
            bool passwordCheck = widget.passwordKey.currentState!.validate();
            if (emailCheck && passwordCheck) {
              setState(() {
                _isLoading = true;
              });
              controller
                  .intentLogin(widget.emailController.text,
                      widget.passwordController.text)
                  .then((value) {
                setState(() {
                  _isLoading = false;
                });
              });
            }
          },
          child: Text(
            'Iniciar Sesión',
            style: TextStyle(
              color: const Color.fromARGB(255, 253, 253, 253),
              fontWeight: FontWeight.bold,
              fontSize: width * 0.06,
              fontFamily: 'ProductSans',
            ),
          ),
        ),
      ),
    );
  }
}
