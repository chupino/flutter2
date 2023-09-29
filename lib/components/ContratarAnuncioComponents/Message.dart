import 'package:diario_el_pueblo/core/helpers/ImageHelper.dart';
import 'package:diario_el_pueblo/core/helpers/LaunchNavigator.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/utils/Urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageAnuncio extends StatelessWidget {
  final String title, content, sendText;
  final MainAxisAlignment? mainAxisAlignmentSend;
  final double? separationSend;
  final Function() send;
  const MessageAnuncio(
      {super.key,
      required this.title,
      required this.content,
      required this.sendText,
      required this.send,
      this.mainAxisAlignmentSend, this.separationSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Get.theme.listTileTheme.tileColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyles.sectionSubtitle),
          const SizedBox(height: 16),
          Text(
            content,
            style: TextStyles.sectionMessage,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: send,
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  mainAxisAlignmentSend ?? MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  height: 50,
                  ImageHelper.selloBlanco,
                ),
                SizedBox(width: separationSend,),
                Text(
                  sendText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
