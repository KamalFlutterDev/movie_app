import 'package:flutter/material.dart';
import 'package:movie_app/models/item_model.dart';

import '../blocs/movies_bloc.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  MovieListState createState() {
    return new MovieListState();
  }
}

class MovieListState extends State<MovieList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text("Loading......",style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.results.length,
      padding: EdgeInsets.all(6),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => goToMoviesDetailPage(snapshot.data, index),
          leading: Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
            fit: BoxFit.cover,
          ),
          title: Text("${snapshot.data.results[index].title}"),
          subtitle: Text("${snapshot.data.results[index].title}"),
        );
      },
    );
  }

  goToMoviesDetailPage(ItemModel data, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return  MovieDetailScreen(
          title: data.results[index].title,
          movieId: data.results[index].id,
        );
    }));
  }
}
