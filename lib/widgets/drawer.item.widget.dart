import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function onValidate;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: icon,
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
      onTap: () => onValidate(),
    );
  }
}
