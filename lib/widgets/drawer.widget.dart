import 'package:flutter/material.dart';
import 'package:tp_mobile/widgets/drawer.header.widget.dart';
import 'package:tp_mobile/widgets/drawer.item.widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const MyDrawerHeader(),
          DrawerItem(
            title: 'Home',
            icon: const Icon(Icons.home),
            onValidate: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          DrawerItem(
            title: 'Counter',
            icon: const Icon(Icons.numbers),
            onValidate: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/counter');
            },
          ),
          DrawerItem(
            title: 'Graphics',
            icon: const Icon(Icons.graphic_eq_outlined),
            onValidate: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/graphics');
            },
          ),
          DrawerItem(
            title: 'Animated Graphics',
            icon: const Icon(Icons.animation),
            onValidate: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/animatedGraphics');
            },
          ),
          const Divider(),
          DrawerItem(
            title: 'Settings',
            icon: const Icon(Icons.settings),
            onValidate: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
