import 'package:diario_el_pueblo/components/AccountComponents/FieldItem.dart';
import 'package:diario_el_pueblo/controller/SessionController.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountFieldsBuilder extends StatefulWidget {
  const AccountFieldsBuilder({super.key});

  @override
  State<AccountFieldsBuilder> createState() => _AccountFieldsBuilderState();
}

class _AccountFieldsBuilderState extends State<AccountFieldsBuilder> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SessionController());
    return FutureBuilder(
      future: controller.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                FieldItemAccount(
                    title: 'Nombre',
                    content: snapshot.data!.nombre,
                    icon: Icons.person),
                const SizedBox(
                  height: 20,
                ),
                FieldItemAccount(
                    title: 'Apellido',
                    content: snapshot.data!.apellido,
                    icon: Icons.person),
                const SizedBox(
                  height: 20,
                ),
                FieldItemAccount(
                    title: 'Email',
                    content: snapshot.data!.correo,
                    icon: Icons.email),
                const SizedBox(
                  height: 20,
                ),
                FieldItemAccount(
                    title: 'Contraseña',
                    content: snapshot.data!.contrasenia,
                    icon: Icons.password),
                const SizedBox(
                  height: 20,
                ),
                FieldItemAccount(
                    title: 'Cuenta Premium',
                    content: snapshot.data!.isPremium
                        ? 'Subscripción Activa'
                        : 'Sin subscripción activa',
                    icon: Icons.star),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.logout();
                        },
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 10))),
                        child: const Text(
                          "Cerrar Sesión",
                          style: TextStyles.listTileTitle,
                        ),
                      ),
                    ),
                  ],
                )
              ]);
        } else {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
      },
    );
  }
}
