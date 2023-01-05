import 'package:books_app/authors/bloc/authors_bloc.dart';
import 'package:books_app/authors/repositories/author_repository.dart';
import 'package:books_app/authors/views/authors_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorsBloc(authorRepository: AuthorRepository()),
      child: MaterialApp(
        title: 'Authors',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthorsListScreen(),
      ),
    );
  }
}
