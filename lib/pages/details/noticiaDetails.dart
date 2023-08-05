import 'package:diario_el_pueblo/controller/NotasController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class NoticiasDetails extends StatefulWidget {
  const NoticiasDetails({super.key});

  @override
  State<NoticiasDetails> createState() => _NoticiasDetailsState();
}

class _NoticiasDetailsState extends State<NoticiasDetails> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotasController());
    final arguments = Get.arguments; //index
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: controller.getNota(index: arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).hoverColor,
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  snapshot.data!["image"] != null
                      ? Image.network(snapshot.data!["image"])
                      : Container(),
                  snapshot.data!["date"] != null
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              snapshot.data!["autor"] != null
                                  ? Text(
                                      snapshot.data!["autor"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  : Container(),
                              const SizedBox(
                                height: 5,
                              ),
                              snapshot.data!["date"] != null
                                  ? Text(
                                      snapshot.data!["date"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      : Container(),
                  snapshot.data!["title"] != null
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Column(
                            children: [
                              Text(
                                snapshot.data!["title"] ?? Container(),
                                style: const TextStyle(
                                    fontSize: 50 / 1.618,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Georgia"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!["description"] ?? Container(),
                                style: const TextStyle(
                                    fontSize: 30.902 / 1.618,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Georgia"),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Html(data: snapshot.data!["content"],) 
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
            );
          } else {
            return Text(snapshot.error.toString());
          }
        },
      ),
    );
  }
}
