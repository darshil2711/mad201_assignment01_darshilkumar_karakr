// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: In-memory destination repository.

import '../models/destination.dart';

class DestinationRepository {
  final List<Destination> _destinations = [];

  DestinationRepository([List<Destination>? initial]) {
    if (initial != null) {
      _destinations.addAll(initial);
    }
  }

  /// Returns unmodifiable list of all destinations.
  List<Destination> getAllDestinations() => List.unmodifiable(_destinations);

  /// Add a destination.
  void addDestination(Destination d) => _destinations.add(d);

  /// Get by id. Returns null if not found.
  Destination? getById(String id) {
    try {
      return _destinations.firstWhere((d) => d.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Toggle favorite for id.
  void toggleFavorite(String id) {
    final d = getById(id);
    if (d != null) d.toggleFavorite();
  }

  /// Mark visited for id.
  void markVisited(String id) {
    final d = getById(id);
    if (d != null) d.markVisited();
  }

  /// Return set of visited countries.
  Set<String> getVisitedCountries() =>
      _destinations.where((d) => d.isVisited).map((d) => d.country).toSet();
}
