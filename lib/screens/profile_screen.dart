// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: Profile screen with tabs: Info, Visited, Stats.

import 'package:flutter/material.dart';
import '../state/travel_app_state.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);
    final profile = model.profile;
    final visited = model.allDestinations.where((d) => d.isVisited).toList();
    final favCount = model.favoritesCount;
    final visitedCountries = model.getVisitedCountries().length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        bottom: TabBar(controller: _tabController, tabs: [Tab(text: 'Info'), Tab(text: 'Visited'), Tab(text: 'Stats')]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Info
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
              CircleAvatar(radius: 44, backgroundImage: AssetImage(profile.profileImageUrl)),
              SizedBox(height: 12),
              Text(profile.name, style: TextStyle(fontSize: 20)),
              SizedBox(height: 6),
              Text('Level: ${profile.travelerLevel}'),
            ]),
          ),

          // Visited
          ListView.builder(
            itemCount: visited.length,
            itemBuilder: (ctx, i) {
              final d = visited[i];
              return ListTile(
                leading: Image.asset(d.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                title: Text(d.name),
                subtitle: Text(d.country),
                onTap: () => Navigator.pushNamed(context, '/details', arguments: d.id),
              );
            },
          ),

          // Stats
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Favorites: $favCount'),
              SizedBox(height: 8),
              Text('Visited destinations: ${visited.length}'),
              SizedBox(height: 8),
              Text('Visited countries: $visitedCountries'),
            ]),
          ),
        ],
      ),
    );
  }
}