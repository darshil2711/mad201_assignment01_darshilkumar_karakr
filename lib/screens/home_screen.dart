// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: Home screen with search and sort.

import 'package:flutter/material.dart';
import '../state/travel_app_state.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';
import '../models/tourist_destination.dart';

enum SortOption { name, country, rating }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  SortOption _sort = SortOption.name;

  /// Filters and sorts the list of destinations based on user input.
  List<Destination> _filterAndSort(List<Destination> list) {
    final q = _query.toLowerCase().trim();

    // Filter by name or country
    final filtered = list.where((d) {
      return d.name.toLowerCase().contains(q) ||
          d.country.toLowerCase().contains(q);
    }).toList();

    // Sort by selected option
    switch (_sort) {
      case SortOption.name:
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortOption.country:
        filtered.sort((a, b) => a.country.compareTo(b.country));
        break;
      case SortOption.rating:
        filtered.sort((a, b) {
          final double ar =
              (a is TouristDestination) ? a.rating : 0.0;
          final double br =
              (b is TouristDestination) ? b.rating : 0.0;
          return br.compareTo(ar); // descending order
        });
        break;
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);
    final all = model.allDestinations;
    final list = _filterAndSort(all);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search by name or country',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => setState(() => _query = v),
              ),
            ),

            // Sort Dropdown
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Text('Sort:'),
                  const SizedBox(width: 8),
                  DropdownButton<SortOption>(
                    value: _sort,
                    items: const [
                      DropdownMenuItem(
                        value: SortOption.name,
                        child: Text('Name'),
                      ),
                      DropdownMenuItem(
                        value: SortOption.country,
                        child: Text('Country'),
                      ),
                      DropdownMenuItem(
                        value: SortOption.rating,
                        child: Text('Rating'),
                      ),
                    ],
                    onChanged: (v) =>
                        setState(() => _sort = v ?? SortOption.name),
                  ),
                  const Spacer(),
                  Text('${list.length} destinations'),
                ],
              ),
            ),

            // Destination List
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx, i) =>
                    DestinationCard(destination: list[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
