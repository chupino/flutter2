import 'package:diario_el_pueblo/components/SettingsComponents/SettingsScheme.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const SettingsScheme(),
        ]))
      ]),
    );
  }
}
