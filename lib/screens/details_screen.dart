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
  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args == null) {
      return Scaffold(appBar: AppBar(title: Text('Details')), body: Center(child: Text('No destination provided')));
    }
    final String id = args as String;
    final dest = model.getById(id);
    if (dest == null) {
      return Scaffold(appBar: AppBar(title: Text('Details')), body: Center(child: Text('Destination not found')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(dest.name),
        actions: [
          IconButton(icon: Icon(dest.isFavorite ? Icons.star : Icons.star_border), onPressed: () => model.toggleFavorite(dest.id)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(dest.imageUrl, width: double.infinity, height: 240, fit: BoxFit.cover),
                if (dest.isVisited)
                  Positioned(top: 12, right: 12, child: VisitedBadge()),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(dest.name, style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 6),
                Text(dest.country),
                SizedBox(height: 12),
                Text(dest.description),
                SizedBox(height: 12),
                if (dest is TouristDestination) Text('Rating: ${(dest as TouristDestination).rating} / 5'),
                if (dest is CulturalDestination) Text('Famous food: ${(dest as CulturalDestination).famousFood}'),
                SizedBox(height: 12),
                Row(children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.check),
                    label: Text(dest.isVisited ? 'Visited' : 'Mark as Visited'),
                    onPressed: dest.isVisited
                        ? null
                        : () {
                            model.markVisited(dest.id);
                            // return id so previous screen can optionally handle it
                            Navigator.pop(context, dest.id);
                          },
                  ),
                  SizedBox(width: 10),
                  OutlinedButton.icon(
                    icon: Icon(dest.isFavorite ? Icons.star : Icons.star_border),
                    label: Text(dest.isFavorite ? 'Favorited' : 'Add to Favorites'),
                    onPressed: () => model.toggleFavorite(dest.id),
                  )
                ])
              ]),
            )
          ],
        ),
      ),
    );
  }
}