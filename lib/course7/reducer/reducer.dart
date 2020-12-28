import 'package:built_collection/built_collection.dart';
import 'package:Proiecte_Android_Flutter/course7/actions/get_movies.dart';
import 'package:Proiecte_Android_Flutter/course7/actions/set_genres.dart';
import 'package:Proiecte_Android_Flutter/course7/actions/set_order_by.dart';
import 'package:Proiecte_Android_Flutter/course7/actions/set_quality.dart';
import 'package:Proiecte_Android_Flutter/course7/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetMoviesStart>(_getMoviesStart),
  TypedReducer<AppState, GetMoviesSuccessful>(_getMoviesSuccessful),
  TypedReducer<AppState, GetMoviesError>(_getMoviesError),
  TypedReducer<AppState, SetQuality>(_setQuality),
  TypedReducer<AppState, SetOrderBy>(_setOrderBy),
  TypedReducer<AppState, SetGenres>(_setGenres)
]);

AppState _getMoviesStart(AppState state, GetMoviesStart action) {
  final AppStateBuilder builder = state.toBuilder();
  builder.isLoading = true;
  return builder.build();
}

AppState _getMoviesSuccessful(AppState state, GetMoviesSuccessful action) {
  final AppStateBuilder builder = state.toBuilder();
  builder
    ..movies.addAll(action.movies)
    ..isLoading = false
    ..page = builder.page + 1;
  return builder.build();
}

AppState _getMoviesError(AppState state, GetMoviesError action) {
  final AppStateBuilder builder = state.toBuilder();
  builder.isLoading = false;
  return builder.build();
}

AppState _setQuality(AppState state, SetQuality action) {
  final AppStateBuilder builder = state.toBuilder();
  builder
    ..quality = action.quality
    ..movies.clear();
  return builder.build();
}

AppState _setOrderBy(AppState state, SetOrderBy action) {
  final AppStateBuilder builder = state.toBuilder();
  builder
    ..orderBy = action.orderBy
    ..movies.clear();
  return builder.build();
}

AppState _setGenres(AppState state, SetGenres action) {
  final AppStateBuilder builder = state.toBuilder();
  builder
    ..genres = ListBuilder<String>(action.genres)
    ..movies.clear();
  return builder.build();
}
