// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357

// Description: App entry point, routes, and main scaffold.

import 'package:flutter/material.dart';
import 'models/tourist_destination.dart';
import 'models/cultural_destination.dart';
import 'repositories/destination_repository.dart';
import 'state/travel_app_model.dart';
import 'state/travel_app_state.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/about_screen.dart';
import 'screens/bookings_screen.dart';

void main() {
  final initial = [
    TouristDestination(
      id: 'paris',
      name: 'Eiffel Tower',
      country: 'France',
      description: 'Iconic iron tower with panoramic views of Paris.',
      imageUrl: 'assets/images/paris.jpg',
      rating: 4.7,
    ),
    CulturalDestination(
      id: 'asakusa',
      name: 'Asakusa',
      country: 'Japan',
      description: 'Historic district with Senso-ji Temple and street food.',
      imageUrl: 'assets/images/tokyo.jpg',
      famousFood: 'Sushi & Tempura',
    ),
    TouristDestination(
      id: 'nyc',
      name: 'Times Square',
      country: 'USA',
      description: 'Busy tourist area with lights and theaters.',
      imageUrl: 'assets/images/nyc.jpg',
      rating: 4.0,
    ),
  ];

  final repo = DestinationRepository(initial);
  final profile = UserProfile(name: 'Your Full Name', travelerLevel: 'Novice', profileImageUrl: 'assets/images/profile_placeholder.png');
  final model = TravelAppModel(repository: repo, profile: profile);

  runApp(TravelAppState(notifier: model, child: TravelApp()));
}

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = TravelAppState.of(context);
    return AnimatedBuilder(
      animation: model,
      builder: (context, _) {
        return MaterialApp(
          title: 'MAD201 Travel App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: model.themeMode,
          initialRoute: '/',
          routes: {
            '/': (ctx) => MainScaffold(),
            '/details': (ctx) => DetailsScreen(),
            '/profile': (ctx) => ProfileScreen(),
            '/settings': (ctx) => SettingsScreen(),
            '/about': (ctx) => AboutScreen(),
            '/bookings': (ctx) => BookingsScreen(),
          },
        );
      },
    );
  }
}

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeScreen(), BookingsScreen(), ProfileScreen()];

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel App')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('Travel App')),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Help: contact your TA or instructor.')));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Bookings'), BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')],
      ),
    );
  }
}