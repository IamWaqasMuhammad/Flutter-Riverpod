import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/screens/future_provider.dart';
import 'package:riverpod_practice/screens/item_screen.dart';
import 'package:riverpod_practice/screens/post_screen.dart';
import 'package:riverpod_practice/screens/screen_four.dart';
import 'package:riverpod_practice/screens/screen_three.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Riverpod Practice',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: ScreenFour(),
    );
  }
}
