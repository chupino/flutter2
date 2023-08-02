import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:diario_el_pueblo/controller/PortadaController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class PortadaHome extends StatefulWidget {
  final TabController tabController;
  const PortadaHome({required this.tabController, super.key});

  @override
  State<PortadaHome> createState() => _PortadaHomeState();
}

class _PortadaHomeState extends State<PortadaHome> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PortadaController());

    return FutureBuilder(
      future: controller.getThumbnail(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
              period: const Duration(seconds: 2),
              baseColor: Colors.grey.withOpacity(0.25),
              highlightColor: Colors.white.withOpacity(0.6),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.9)),
              ));
        }
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return GestureDetector(
            onTap: (() {
              setState(() {
                widget.tabController.animateTo(1);
              });
            }),
            child: Container(
                height: 400,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CachedMemoryImage(
                  bytes: snapshot.data!,
                  uniqueKey: "thumbnail",
                  fit: BoxFit.cover,
                )
                /* Image.memory(
                snapshot.data!,
                fit: BoxFit.cover,
              ), */
                ),
          );
        }
      },
    );
  }
}
