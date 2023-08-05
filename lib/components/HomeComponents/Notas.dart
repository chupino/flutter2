import 'package:cached_network_image/cached_network_image.dart';
import 'package:diario_el_pueblo/controller/NotasController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class NotasHome extends StatefulWidget {
  const NotasHome({super.key});

  @override
  State<NotasHome> createState() => _NotasHomeState();
}

class _NotasHomeState extends State<NotasHome> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotasController());
    return FutureBuilder(
      future: controller.getNotas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
            children: [
              Shimmer.fromColors(
                  period: const Duration(seconds: 2),
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.6),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.withOpacity(0.9)),
                  )),
              Column(
                children: [
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 32,
                        width: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                  Shimmer.fromColors(
                      period: const Duration(seconds: 2),
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        height: 32,
                        width: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.withOpacity(0.9)),
                      )),
                ],
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: const Divider(
                      thickness: 1,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('notaDetails', arguments: index);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width - 20,
                        child: ListTile(
                            title: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Text(
                                snapshot.data![index]["title"] ?? Container(),
                                style: const TextStyle(
                                    fontFamily: "Georgia", fontSize: 20),
                              ),
                            ),
                            leading: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: double.maxFinite,
                                child: CachedNetworkImage(
                                  imageUrl: snapshot.data![index]["image"],
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.black12,
                                    child: const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                )),
                            subtitle: Container(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: snapshot.data![index]["author"] != null
                                  ? Text(snapshot.data![index]["author"])
                                  : const Text(""),
                            ))),
                  ),
                ]),
              );
            },
          );
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }
}
