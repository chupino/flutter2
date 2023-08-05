import 'package:diario_el_pueblo/controller/SearchController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode searchFocusNode = FocusNode();
    final controller = Get.put(ExploreController());
    final searchController = TextEditingController();

    return TextField(
      focusNode: searchFocusNode,
      onSubmitted: (value) {
        controller.enviarPortalBusqueda(search: value);
      },
      controller: searchController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide:
              BorderSide(color: Get.theme.focusColor), // Agrega esta línea
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        hintText: 'Buscar...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            //_searchFocusNode.unfocus();
            controller.enviarPortalBusqueda(search: searchController.text);
          },
        ),
      ),
    );
  }
}
