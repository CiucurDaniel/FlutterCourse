import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/*
During Course 2 we learned how to make a HTTP GET Request with Flutter
and later on also how to make a Model class

We made a request from yts.mx which does not require an api key

To run this you need to create a "Run/Debug configuration in IntelliJ IDEA
with Dart console application and select this file which as you can see has the main method
 */

Future<void> main() async {
  // perform http get
  final http.Response response = await http.get('https://yts.mx/api/v2/list_movies.json');

  //response.body e type string si atunci folosim jsonDecode sa il facem json
  final Map<String, dynamic> responseMap = jsonDecode(response.body);

  // Go deeper at the data property
  final Map<String, dynamic> data = responseMap['data'];

  // Get the movies inside a list
  final List<dynamic> movies = data['movies'];

  final List<Movie> movieList = <Movie>[];

  for (int i = 0; i < movies.length; i++) {
    final Map<String, dynamic> item = movies[i];

    final Movie movie = Movie(
      id: item['id'],
      title: item['title'],
      year: item['year'],
      runtime: item['runtime'],
      cover: item['cover'],
    ); // Movie

    movieList.add(movie);
  }

  //print(response.body);
  //print(responseMap['status']);
  //print(responseMap['data']['movies'][0]['title']);
  //String firstMovie = await response['data']['movies'][0]['title'];

  movieList.forEach(print);
}

// Movie model

class Movie {
  Movie({@required this.id, @required this.title, @required this.year, @required this.runtime, @required this.cover});

  final int id;
  final String title;
  final int year;
  final int runtime;
  final String cover;

  @override
  String toString() {
    return 'Movie: $title, year: $year, runtime: $runtime, $cover';
  }
}
