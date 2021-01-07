import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Movie.dart';

class Services {
  static const String url = 'https://yts.mx/api/v2/list_movies.json';

  static Future<List<Movie>> getMovies() async {
    final http.Response response = await http.get(url);
    final List<Movie> listOfMovies = parseMovies(response.body);
    return listOfMovies;
  }

  static List<Movie> parseMovies(String responseBody) {
    // Couldn't manage to make this work

    //final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    //return parsed.entries.map<Movie>((dynamic json) => Movie.fromJson(json)).toList();

    // So i did it like this for now:

    //response.body is of type string so we use jsonDecode
    final Map<String, dynamic> responseMap = jsonDecode(responseBody);

    // Go deeper at the data property
    final Map<String, dynamic> data = responseMap['data'];

    //Go even deeper the array of movie
    final List<dynamic> movies = data['movies'];

    final List<Movie> list = movies.map((dynamic val) => Movie.fromJson(val)).toList();

    return list;
  }
}
