// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: ChangeNotifier holding app-wide state.

import 'package:flutter/material.dart';
import '../repositories/destination_repository.dart';
import '../models/destination.dart';

class UserProfile {
  String name;
  String travelerLevel;
  String profileImageUrl;

  UserProfile({
    required this.name,
    this.travelerLevel = 'Novice',
    required this.profileImageUrl,
  });
}

class TravelAppModel extends ChangeNotifier {
  final DestinationRepository repository;
  UserProfile profile;
  ThemeMode themeMode = ThemeMode.light;

  TravelAppModel({required this.repository, required this.profile});

  List<Destination> get allDestinations => repository.getAllDestinations();

  Destination? getById(String id) => repository.getById(id);

  void addDestination(Destination d) {
    repository.addDestination(d);
    notifyListeners();
  }

  void toggleFavorite(String id) {
    repository.toggleFavorite(id);
    notifyListeners();
  }

  void markVisited(String id) {
    repository.markVisited(id);
    notifyListeners();
  }

  Set<String> getVisitedCountries() => repository.getVisitedCountries();

  int get favoritesCount =>
      repository.getAllDestinations().where((d) => d.isFavorite).length;

  int get visitedCount =>
      repository.getAllDestinations().where((d) => d.isVisited).length;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void updateProfile(UserProfile p) {
    profile = p;
    notifyListeners();
  }
}