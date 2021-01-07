import 'package:Proiecte_Android_Flutter/courses/course6/actions/get_movies.dart';
import 'package:Proiecte_Android_Flutter/courses/course6/models/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is GetMoviesSuccessful) {
    final AppStateBuilder builder = state.toBuilder();
    builder.movies.addAll(action.movies);
    return builder.build();
  }

  return state;
}
