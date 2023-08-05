import 'package:flutter/material.dart';

class FieldItemAccount extends StatelessWidget {
  final String title, content;
  final IconData icon;
  const FieldItemAccount(
      {super.key,
      required this.title,
      required this.content,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title),
      subtitle: Text(content),
      leading: Icon(icon),
    );
  }
}
