import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  double fontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Text(
              'Préférences',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Activer les notifications push'),
            secondary: const Icon(Icons.notifications_outlined,
                color: Colors.teal),
            value: notificationsEnabled,
            activeColor: Colors.teal,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Mode sombre'),
            subtitle: const Text('Thème dark de l\'application'),
            secondary:
                const Icon(Icons.dark_mode_outlined, color: Colors.teal),
            value: darkModeEnabled,
            activeColor: Colors.teal,
            onChanged: (value) {
              setState(() {
                darkModeEnabled = value;
              });
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'Affichage',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
                letterSpacing: 1.2,
              ),
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.format_size, color: Colors.teal),
            title: const Text('Taille du texte'),
            subtitle: Slider(
              value: fontSize,
              min: 10,
              max: 24,
              divisions: 7,
              activeColor: Colors.teal,
              label: fontSize.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  fontSize = value;
                });
              },
            ),
            trailing: Text(
              '${fontSize.toInt()}px',
              style: const TextStyle(color: Colors.teal),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'À propos',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline, color: Colors.teal),
            title: Text('Version'),
            trailing: Text('1.0.0', style: TextStyle(color: Colors.grey)),
          ),
          const ListTile(
            leading: Icon(Icons.school, color: Colors.teal),
            title: Text('Application'),
            trailing: Text('DWM ENSET 2026',
                style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
