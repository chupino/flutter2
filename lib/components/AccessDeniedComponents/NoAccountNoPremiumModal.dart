import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoAccountNoPremiumModal {
  BuildContext context;
  TabController tabController;
  NoAccountNoPremiumModal({required this.tabController, required this.context});
  void openModal() async {
    showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            tabController.animateTo(0);
            return Future.value(false);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contenido Exclusivo',
                  style: TextStyles.modalTitle,
                ),
                Text(
                  'Suscribete si quieres tener acceso a este contenido',
                  style: TextStyles.modalSubtitle,
                ),
                const Divider(),
                InkWell(
                  onTap: () {},
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
                    tabController.animateTo(0);
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
          ),
        );
      },
    );
  }
}
