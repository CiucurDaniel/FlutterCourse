import 'package:Proiecte_Android_Flutter/course7/actions/get_movies.dart';
import 'package:Proiecte_Android_Flutter/course7/data/yts_api.dart';
import 'package:Proiecte_Android_Flutter/course7/models/app_state.dart';
import 'package:Proiecte_Android_Flutter/course7/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  const AppEpics({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[TypedEpic<AppState, GetMoviesStart>(_getMoviesStart)]);
  }

  Stream<dynamic> _getMoviesStart(Stream<GetMoviesStart> actions, EpicStore<AppState> store) {
    return actions
        .asyncMap((GetMoviesStart event) =>
            _ytsApi.getMovies(event.page, store.state.quality, store.state.genres.toList(), store.state.orderBy))
        .map<dynamic>((List<Movie> event) => GetMoviesSuccessful(event))
        .onErrorReturnWith((dynamic error) => GetMoviesError(error));
  }
}
