import 'package:bloc/bloc.dart';
import 'package:books_app/app.dart';
import 'package:books_app/simple_observer.dart';
import 'package:flutter/material.dart';

void main() async {
  Bloc.observer = SimpleObserver();

  runApp(const MyApp());
}
