/// MAD201-01 Assignment 1
/// Darshilkumar Karkar / A00203357
import 'destination.dart';

class TouristDestination extends Destination {
  double rating;
  TouristDestination({
    required String id,
    required String name,
    required String country,
    required String description,
    required String imageUrl,
    this.rating = 0.0,
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
