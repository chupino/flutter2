import 'package:diario_el_pueblo/components/LoginComponents/LoginSection.dart';
import 'package:diario_el_pueblo/core/constants/LightColorPalette.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';

class LoginScheme extends StatelessWidget {
  const LoginScheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(color: LightColorPalette().loginBackgroundColor),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Iniciar Sesión',
                    style: TextStyles.loginTitle,
                  ),
                  Text('Bienvenido al diario El Pueblo',
                      style: TextStyles.loginSubtitle),
                ],
              ),
            ),
            LoginSection(),
          ],
        ),
      ),
    );
  }
}
