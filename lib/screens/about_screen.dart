// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: Static about screen.

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Text('MAD201 Assignment 1 - Travel App\n\nDemonstrates Dart OOP, navigation, app-wide state, search/sort, dark mode, and returning data between screens.'),
      ),
    );
  }
}