import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

void main() async {
  // perform http get
  final http.Response response =
  await http.get('https://yts.mx/api/v2/list_movies.json');

  //response.body e type string si atunci folosim jsonDecode sa il facem json
  final Map<String, dynamic> responseMap = jsonDecode(response.body);

  //print(response.body);
  //print(responseMap['status']);
  //print(responseMap['data']['movies'][0]['title']);

  final List<Movie> movieList = <Movie>[];
}

//String firstMovie = await response['data']['movies'][0]['title'];

class Movie {
  Movie({
    @required this.id,
    @required this.title,
    @required this.year,
    @required this.runtime,
    @required this.cover
  });

  final int id;
  final String title;
  final int year;
  final int runtime;
  final String cover;
}