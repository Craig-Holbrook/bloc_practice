import 'package:books_app/authors/views/authors_list_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthorsListScreen());
      default:
        return null;
    }
  }
}
