# mad201_assignment01_darshilkumar_karakr

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


F2025 MAD201-01 Cross Platform MA
Assignment 1
Objective
Students will demonstrate advanced usage of:
 Dart OOP (classes, constructors, methods, inheritance, collections, null safety).
 Stateless & Stateful Widgets (custom reusable components).
 Layouts with styling (Row, Column, Container, Stack, Flexible, Expanded).
 Multiple navigation approaches (Navigator, Named Routes, Tabs, Drawer, BottomNavigationBar).
 Passing & returning data between screens.
 Maintaining app-wide state with a central model (not external packages, just inherited
data/stateful widget at root).
Requirements
Part A – Dart OOP & Data Models
1. Create a class hierarchy:
o Destination (base class) with properties:
 name, country, description, imageUrl, isFavorite, isVisited.
o TouristDestination extends Destination with an extra property rating (double).
o CulturalDestination extends Destination with an extra property famousFood (String).
2. Create a repository class DestinationRepository that:
o Stores a **List<Destination>`.
o Provides methods to:
 getAllDestinations()
 toggleFavorite(Destination d)
 markVisited(Destination d)
 getVisitedCountries() (returns a Set<String>).
Part B – Multi-Screen UI
1. Home Screen
o List all destinations (with image, name, country).
o Show favorite toggle button (star).
o Tapping an item navigates to a Details Screen.
2. Details Screen
o Show full info (image, description, rating/famousFood).
o Buttons:
 “Mark as Visited” → updates repository + sends data back.
 “Add to Favorites”.
o Return updated state to Home Screen via Navigator.pop(context, updatedDestination).
3. Profile Screen
o Show user info (name, traveler level, profile picture).
o Show Tabs:
 Tab 1 → User info.
 Tab 2 → List of visited destinations.
 Tab 3 → Statistics (number of favorites, number of visited countries).
Part C – Navigation
1. Implement BottomNavigationBar with 3 items:
o Home
o Bookings (placeholder now, “No bookings yet”).
o Profile
2. Add a Drawer with:
o Settings → open placeholder screen.
o Help → show a SnackBar.
o About → navigate to About Screen (static text).
3. Use Named Routes for at least 3 screens.
Part D – App-Wide State
 Create a TravelAppState (inherited widget or top-level stateful widget).
 It holds the list of destinations + user profile.
 Updating favorites/visited in one screen should reflect across others (Home ↔ Profile).
Part E – Additional Requirements
1. Add a search bar on Home to filter destinations by name/country.
2. Add a sort option (by rating, country, or name).
3. Add a Stack widget on Details Screen to overlay a “Visited” badge over the destination image when
marked.
4. Implement dark mode toggle inside Settings.
5. Add returning data (when a destination is marked visited, send that back and update Home
automatically).
Documentation
When you submit your Flutter program, include proper documentation. Documentation is part of
programming best practices and will count toward your grade.
 Header Comments at the top of each Dart file:Include:
o Course code and lab number
o Your full name and Student ID
o A short description of what program does.
 Class & Method Documentation using DartDoc style (///):
o /// Represents a travel destination.
o class Destination {
o /// Name of the destination.
o final String name;
o
o /// Toggles favorite status for this destination.
o void toggleFavorite() { ... }
o }
 Inline Comments
Submission
All work for this lab must be submitted through GitHub. You will practice both coding and professional
collaboration workflows.
1. Create a Repository
a. Go to Github and create a new public repository.
b. Name it : MAD201-ASSIGNMENT01-YOURNAME
c. Add a README.md with:
i. Lab title and your name / ID
ii. A short description of the project
2. Commit Requirements
a. You must have at least 5 commits.
b. Commits should be meaningful and descriptive (not “update” or “fix”).
3. Pull Request Requirements.
a. You must create at least 3 Pull Requests (PRs), each with a clear title and description.
b. Each PR should represent a logical feature or change. For example:
i. Add Student class and constructors.
ii. Implement Gradebook menu and input handling
iii. Add utilities (operator demo, type casting, recursion)
c. Even if you are working alone, you can:
i. Create a new branch (e.g., feature-student-class)
ii. Push changes
iii. Open a PR into main
iv. Merge it after review (self-review allowed in this case).
4. Final Submission
a. Push your final version to Github.
b. Ensure your repo has:
i. All code with complete documentation
ii. At least 5 meaningful commits.
iii. At least 3 merged pull requests.
iv. A README.md explaining your project.
5. What to Submit to Instructor
a. Submit the GitHub Repository link.
b. Make sure the repo is public.
Marking Rubric (25 points)
 Core Dart OOP & Collections (15 marks)
 Home Screen with Favorites & Details (20 marks)
 Profile Screen with Tabs + Stats (15 marks)
 Navigation: BottomNav + Drawer + Named Routes (20 marks)
 App-wide State Management (15 marks)
 GitHub Workflow (5 marks)
 Additional Requirements (up to 5 marks extra)
 Documentation ( 5 marks)