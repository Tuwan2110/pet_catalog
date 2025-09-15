import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hewan Peliharaan',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
      routes: {'/search': (_) => SearchScreen()},
    );
  }
}