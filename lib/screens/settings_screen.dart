import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final MaterialColor primarySwatch;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<MaterialColor> onPrimarySwatchChanged;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.primarySwatch,
    required this.onDarkModeChanged,
    required this.onPrimarySwatchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              value: isDarkMode,
              onChanged: onDarkModeChanged,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Primary Color'),
              trailing: DropdownButton<MaterialColor>(
                value: primarySwatch,
                items: const [
                  DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
                  DropdownMenuItem(value: Colors.green, child: Text('Green')),
                  DropdownMenuItem(value: Colors.red, child: Text('Red')),
                ],
                onChanged: (color) {
                  if (color != null) onPrimarySwatchChanged(color);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
