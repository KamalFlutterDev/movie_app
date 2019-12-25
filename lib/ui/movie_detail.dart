import 'package:flutter/material.dart';


class MovieDetailScreen extends StatefulWidget {
  final String title;

  final int movieId;

  MovieDetailScreen({
    this.title,
    this.movieId,
  });

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${widget.title}"),
      ),
    );
  }



}
