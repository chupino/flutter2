import 'package:diario_el_pueblo/components/AccessDeniedComponents/NoAccountModal.dart';
import 'package:diario_el_pueblo/controller/SessionController.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionesSettings extends StatelessWidget {
  const OptionesSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SessionController());

    return Column(
      children: [
        ListTile(
          title: const Text(
            "Mi Cuenta",
            style: TextStyles.optionsTile,
          ),
          subtitle: const Text(
            "Cambiar datos personales",
            style: TextStyles.optionsSubtitle,
          ),
          leading: Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
          trailing: Icon(Icons.arrow_right_rounded,
              size: 30, color: Theme.of(context).iconTheme.color),
          onTap: () async {
            final bool isLogged = await controller.isLogged();

            if (isLogged) {
              Get.toNamed('/accountPage');
            } else {
              // ignore: use_build_context_synchronously
              NoAccountModal(context: context).openModal();
            }
          },
        ),
        ListTile(
          title: const Text(
            "Apariencia",
            style: TextStyles.optionsTile,
          ),
          subtitle: const Text("Seleccione el tema",
              style: TextStyles.optionsSubtitle),
          leading: Icon(Icons.mode_night_outlined,
              size: 30, color: Theme.of(context).iconTheme.color),
          trailing: Icon(Icons.arrow_right_rounded,
              size: 30, color: Theme.of(context).iconTheme.color),
          onTap: () {
            Get.toNamed('/switchTheme');
          },
        ),
      ],
    );
  }
}
