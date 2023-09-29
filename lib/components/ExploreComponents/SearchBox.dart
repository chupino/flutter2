import 'package:diario_el_pueblo/controller/SearchController.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:diario_el_pueblo/utils/Themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode searchFocusNode = FocusNode();
    final controller = Get.put(ExploreController());
    final searchController = TextEditingController();

    return Theme(
      data: Get.isDarkMode ? Themes().darkTheme : Themes().lightTheme,
      child: TextField(
        focusNode: searchFocusNode,
        onSubmitted: (value) {
          controller.enviarPortalBusqueda(search: value);
        },
        controller: searchController,
        decoration: InputDecoration(
          fillColor: Theme.of(context).primaryColor.withOpacity(0.2),
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Get.theme.dividerTheme.color!.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide:
                BorderSide(color: Get.theme.focusColor), // Agrega esta línea
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          hintText: 'Buscar...',
          hintStyle: TextStyles.hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Get.theme.dividerTheme.color!.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(30.0),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              //_searchFocusNode.unfocus();
              controller.enviarPortalBusqueda(search: searchController.text);
            },
          ),
        ),
      ),
    );
  }
}
