// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: Small "Visited" badge overlay.

import 'package:flutter/material.dart';

class VisitedBadge extends StatelessWidget {
  const VisitedBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(6)),
      child: Text('Visited', style: TextStyle(color: Colors.white)),
    );
  }
}