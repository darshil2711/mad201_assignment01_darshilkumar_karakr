// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: List tile widget displaying a single travel destination.

import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../state/travel_app_state.dart';

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            destination.imageUrl,
            width: 72,
            height: 72,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.image_not_supported,
              size: 48,
              color: Colors.grey,
            ),
          ),
        ),
        title: Text(
          destination.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(destination.country),
        trailing: IconButton(
          icon: Icon(
            destination.isFavorite ? Icons.star : Icons.star_border,
            color: destination.isFavorite ? Colors.amber : Colors.grey,
          ),
          tooltip: destination.isFavorite ? 'Remove Favorite' : 'Add Favorite',
          onPressed: () => model.toggleFavorite(destination.id),
        ),
        onTap: () async {
          // Navigate to the details page and optionally handle returned data
          final result = await Navigator.pushNamed(
            context,
            '/details',
            arguments: destination.id,
          );

          // Optionally handle updated data
          if (result != null) {
            // If your TravelAppState auto-updates UI, you can skip this.
            // Otherwise, call model.notifyListeners() or setState() in the parent.
          }
        },
      ),
    );
  }
}
