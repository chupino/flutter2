import 'package:diario_el_pueblo/components/AccountComponents/Fields.dart';
import 'package:diario_el_pueblo/core/helpers/TextStyles.dart';
import 'package:flutter/material.dart';

class AccountScheme extends StatelessWidget {
  const AccountScheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Cuenta',
            style: TextStyles.sectionTitle,
          ),
          Divider(),
          AccountFieldsBuilder()
        ],
      ),
    );
  }
}
