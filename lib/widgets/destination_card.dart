// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: List tile for destination.

import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../state/travel_app_state.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(destination.imageUrl, width: 72, height: 72, fit: BoxFit.cover),
        ),
        title: Text(destination.name),
        subtitle: Text(destination.country),
        trailing: IconButton(
          icon: Icon(destination.isFavorite ? Icons.star : Icons.star_border),
          onPressed: () => model.toggleFavorite(destination.id),
        ),
        onTap: () async {
          final result = await Navigator.pushNamed(context, '/details', arguments: destination.id);
          // result may be id of updated destination; model notifies so UI updates automatically
        },
      ),
    );
  }
}