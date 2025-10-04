/// MAD201-01 Assignment 1
/// Darshilkumar Karkar / A00203357
/// Represents a travel destination.
abstract class Destination {
  final String id;
  final String name;
  final String country;
  final String description;
  final String imageUrl;
  bool isFavorite;
  bool isVisited;

  Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    this.isFavorite = false,
    this.isVisited = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  void markVisited() {
    isVisited = true;
  }

  String shortLabel() => '$name, $country';
}
