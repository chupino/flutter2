import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardExplore extends StatelessWidget {
  final String title, image;
  final Function() onTap;
  const CardExplore(
      {super.key, required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        height: MediaQuery.of(context).size.height * 0.2 - 62,
                        width: MediaQuery.of(context).size.width / 2 - 60,
                        fit: BoxFit.fill,
                      )),
                  Text(title,
                      style: TextStyle(
                          fontSize: 25,
                          )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
