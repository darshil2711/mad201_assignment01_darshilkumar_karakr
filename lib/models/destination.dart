// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: Base Destination model for MAD201 assignment.

/// Represents a travel destination.
abstract class Destination {
  /// Unique id.
  final String id;

  /// Name (e.g., Paris).
  final String name;

  /// Country (e.g., France).
  final String country;

  /// Detailed description.
  final String description;

  /// Asset path or network URL to image.
  final String imageUrl;

  /// Favorite flag.
  bool isFavorite;

  /// Visited flag.
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

  /// Toggle favorite flag.
  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  /// Mark as visited.
  void markVisited() {
    isVisited = true;
  }
}
