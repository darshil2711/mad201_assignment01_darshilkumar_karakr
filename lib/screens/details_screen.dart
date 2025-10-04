// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: Details screen showing full info and mark visited.

import 'package:flutter/material.dart';
import '../state/travel_app_state.dart';
import '../widgets/visited_badge.dart';
import '../models/destination.dart';
import '../models/tourist_destination.dart';
import '../models/cultural_destination.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! String) {
      return Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: const Center(child: Text('No destination provided')),
      );
    }

    final String id = args;
    final Destination? dest = model.getById(id);

    if (dest == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: const Center(child: Text('Destination not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(dest.name),
        actions: [
          IconButton(
            icon: Icon(dest.isFavorite ? Icons.star : Icons.star_border),
            onPressed: () => model.toggleFavorite(dest.id),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  dest.imageUrl,
                  width: double.infinity,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                if (dest.isVisited)
                  const Positioned(
                    top: 12,
                    right: 12,
                    child: VisitedBadge(),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dest.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(dest.country),
                  const SizedBox(height: 12),
                  Text(dest.description),
                  const SizedBox(height: 12),
                  if (dest is TouristDestination)
                    Text('Rating: ${dest.rating} / 5'),
                  if (dest is CulturalDestination)
                    Text('Famous food: ${dest.famousFood}'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.check),
                        label: Text(
                            dest.isVisited ? 'Visited' : 'Mark as Visited'),
                        onPressed: dest.isVisited
                            ? null
                            : () {
                                model.markVisited(dest.id);
                                Navigator.pop(context, dest.id);
                              },
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton.icon(
                        icon: Icon(
                            dest.isFavorite ? Icons.star : Icons.star_border),
                        label: Text(dest.isFavorite
                            ? 'Favorited'
                            : 'Add to Favorites'),
                        onPressed: () => model.toggleFavorite(dest.id),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
