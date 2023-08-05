import 'package:diario_el_pueblo/controller/ThemeController.dart';
import 'package:diario_el_pueblo/core/helpers/ImageHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitcherBuilder extends StatefulWidget {
  final Size size;
  const SwitcherBuilder({super.key, required this.size});

  @override
  State<SwitcherBuilder> createState() => _SwitcherBuilderState();
}

class _SwitcherBuilderState extends State<SwitcherBuilder> {
  final controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.isDark(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.switchTheme();
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: widget.size.width / 3,
                          child: snapshot.data == false
                              ? Image.asset(
                                  ImageHelper.lightModeActive,
                                )
                              : Image.asset(ImageHelper.lightMode),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.light_mode_outlined,
                                  color: snapshot.data == false
                                      ? const Color(0xFFdd3333)
                                      : Colors.white),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Modo Claro",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: snapshot.data == false
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ])
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        controller.switchTheme();
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: widget.size.width / 3,
                          child: snapshot.data == true
                              ? Image.asset(
                                  ImageHelper.darkModeActive,
                                )
                              : Image.asset(ImageHelper.darkMode),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.light_mode_outlined,
                                  color: snapshot.data == true
                                      ? const Color(0xFFdd3333)
                                      : Colors.black),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Modo Oscuro",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: snapshot.data == true
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ])
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
