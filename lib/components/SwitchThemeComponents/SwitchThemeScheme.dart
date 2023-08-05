import 'package:diario_el_pueblo/components/SwitchThemeComponents/SwitcherBuilder.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';

class SwitchThemeScheme extends StatelessWidget {
  const SwitchThemeScheme({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Tema',
            style: TextStyles.sectionTitle,
          ),
          const Divider(),
          Expanded(child: SwitcherBuilder(size: size,))
        ],
      ),
    );
  }
}
