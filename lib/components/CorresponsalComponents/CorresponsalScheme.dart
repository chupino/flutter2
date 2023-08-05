import 'package:diario_el_pueblo/components/CorresponsalComponents/Button.dart';
import 'package:diario_el_pueblo/components/CorresponsalComponents/MessageField.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CorresponsalScheme extends StatelessWidget {
  const CorresponsalScheme({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sé un Corresponsal",
                style: TextStyles.sectionTitle,
                textAlign: TextAlign.left,
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Get.theme.listTileTheme.tileColor),
                child: Column(
                  children: [
                    const Text(
                      "Comparte información valiosa con otros miembros de la comunidad para hacerla más segura.",
                      style: TextStyles.sectionMessage,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MessageCorresponsal(controller: textEditingController,),
                    const SizedBox(
                      height: 20,
                    ),
                    ButtonSendCorresponsal(controller: textEditingController,)
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
