import 'package:bored_app/activities/view/generate_activities.dart';
import 'package:bored_app/favorites/favorites.dart';
import 'package:bored_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? l10n.generateNavTitle : l10n.favoritesNavTitle),
        titleTextStyle: Theme.of(context).textTheme.headline5,
      ),
      body: const [
        GenerateActivities(),
        FavoriteActivities(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: const Icon(Icons.add), label: l10n.generateBottomNav),
          NavigationDestination(icon: const Icon(Icons.favorite), label: l10n.favoritesBottomNav)
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
