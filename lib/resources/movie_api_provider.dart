import 'dart:async';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:movie_app/models/item_model.dart';



class MovieApiProvider {

  http.Client client = http.Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
       throw Exception('Failed to load movies list');
    } 
  }


}