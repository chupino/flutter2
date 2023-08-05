import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NoAccountModal {
  BuildContext context;
  NoAccountModal({required this.context});
  void openModal() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'No haz iniciado sesión',
                style: TextStyles.modalTitle,
              ),
              Text(
                'Para continuar tienes que iniciar sesión',
                style: TextStyles.modalSubtitle,
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Get.toNamed('/login');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.login),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Iniciar Sesión',
                        style: TextStyles.modalSubtitle,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.close),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Ahora no',
                        style: TextStyles.modalSubtitle,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
