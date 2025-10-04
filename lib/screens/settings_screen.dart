// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: Settings screen with dark mode toggle.

import 'package:flutter/material.dart';
import '../state/travel_app_state.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Dark mode'),
            value: model.themeMode == ThemeMode.dark,
            onChanged: (v) => model.toggleTheme(),
          ),
          ListTile(title: Text('Other setting (placeholder)'), subtitle: Text('Add more here')),
        ],
      ),
    );
  }
}