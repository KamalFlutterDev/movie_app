import 'package:flutter/material.dart';
import 'package:movie_app/ui/movie_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}
