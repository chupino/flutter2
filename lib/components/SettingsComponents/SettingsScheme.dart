import 'package:diario_el_pueblo/components/SettingsComponents/Options.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';

class SettingsScheme extends StatelessWidget {
  const SettingsScheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Ajustes",
                style: TextStyles.sectionTitle,
                textAlign: TextAlign.left,
              ),
              Divider(),
              OptionesSettings()
            ]));
  }
}
