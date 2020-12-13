import 'package:flutter/material.dart';
import 'Movie.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title ${movie.title} - Details'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('Details of movie ${movie.title}'),
          ),
          Image.network(movie.iconLink),
          Text('Year: ' + movie.year.toString()),
          Text('Runtime: ' + movie.runtime.toString()),
          Text('Rating: ' + movie.rating.toString()),
        ],
      ),
    );
  }
}
