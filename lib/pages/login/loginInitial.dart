import 'package:diario_el_pueblo/components/LoginInitialComponents/LoginScheme.dart';
import 'package:diario_el_pueblo/core/constants/LightColorPalette.dart';
import 'package:flutter/material.dart';

class LoginInitialPage extends StatelessWidget {
  const LoginInitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: LightColorPalette().loginBackgroundColor),
      body: const LoginInitalScheme(),
    );
  }
}
