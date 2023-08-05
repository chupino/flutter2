import 'package:diario_el_pueblo/components/SettingsComponents/SettingsScheme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                iconTheme: const IconThemeData(size: 50),
                title: Image.asset('assets/images/logo_blanco.png'),
                expandedHeight: 50,
                automaticallyImplyLeading: false,
                pinned: true,
              ),
            ];
          },
          body: const SettingsScheme()),
    );
  }
}
