import 'package:Proiecte_Android_Flutter/homework_5/DetailsPage.dart';
import 'package:flutter/material.dart';
import 'Movie.dart';
import 'Services.dart';

/*
The following is a Movie app which has a list view with movies
and we can sort the movies based on different filters

The app takes it's data from an api: yts
which does not require an api key
 */

enum Sorting { ascending, descending }

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final List<String> items = List<String>.generate(10000, (int i) => 'Item $i');

  List<Movie> movies = <Movie>[];
  Sorting _sortType = Sorting.ascending;
  Sorting _sortTypeNumerical = Sorting.ascending;

  void _sortAlphabetically() {
    setState(() {
      if (_sortType == Sorting.ascending) {
        print('sort alphabetically');
        _sortType = Sorting.descending;
        movies.sort((Movie a, Movie b) => a.title.compareTo(b.title));
      } else {
        print('sort reverse alphabetically');
        _sortType = Sorting.ascending;
        movies.sort((Movie b, Movie a) => a.title.compareTo(b.title));
      }
    });
  }

  void _sortByRating() {
    setState(() {
      if (_sortTypeNumerical == Sorting.ascending) {
        print('sort ascending');
        _sortTypeNumerical = Sorting.descending;
        movies.sort((Movie a, Movie b) => a.rating.compareTo(b.rating));
      } else {
        print('sort descending');
        _sortTypeNumerical = Sorting.ascending;
        movies.sort((Movie b, Movie a) => a.rating.compareTo(b.rating));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Services.getMovies().then((List<Movie> moviesFromRequest) {
      setState(() {
        movies = moviesFromRequest;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Collection'),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(16.0), hintText: 'Search for a movie...'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Sort by title: ',
              ),
              IconButton(
                icon: const Icon(Icons.sort_by_alpha),
                onPressed: _sortAlphabetically,
                color: Colors.amber,
              ),
              const Text(
                'Sort by rating: ',
              ),
              IconButton(
                icon: const Icon(Icons.arrow_downward),
                onPressed: _sortByRating,
                color: Colors.amber,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.local_movies),
                  title: Text('${movies[index].title}'),
                  subtitle: Text(
                      'Rating: ${movies[index].rating}, Year: ${movies[index].year}, Runtime: ${movies[index].runtime}'),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute<DetailsPage>(builder: (BuildContext context) => DetailsPage(movies[index])));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
