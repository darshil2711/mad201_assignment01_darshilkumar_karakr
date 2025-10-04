// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: CulturalDestination extends Destination with famousFood.

import 'destination.dart';

/// Cultural destination notable for local food.
class CulturalDestination extends Destination {
  final String famousFood;

  CulturalDestination({
    required String id,
    required String name,
    required String country,
    required String description,
    required String imageUrl,
    required this.famousFood,
    bool isFavorite = false,
    bool isVisited = false,
  }) : super(
          id: id,
          name: name,
          country: country,
          description: description,
          imageUrl: imageUrl,
          isFavorite: isFavorite,
          isVisited: isVisited,
        );
}