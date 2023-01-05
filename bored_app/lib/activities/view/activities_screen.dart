import 'package:bored_app/activities/view/generate_activities.dart';
import 'package:bored_app/favorites/view/favorite_activities.dart';
import 'package:flutter/material.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Need something to do?'),
      ),
      body: const [
        GenerateActivities(),
        FavoriteActivities(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: 'Generate'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites')
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
