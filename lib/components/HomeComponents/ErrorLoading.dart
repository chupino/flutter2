import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';

class ErrorLoading extends StatelessWidget {
  final Function() refresh;
  final String message;
  const ErrorLoading({super.key, required this.refresh, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyles.sectionSubtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              Icons.wifi_off,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)))),
                onPressed: () {
                  refresh();
                },
                child: const Text('Reintentar'))
          ],
        ));
  }
}
