import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:Proiecte_Android_Flutter/courses/course5/actions/get_movies.dart';
import 'package:Proiecte_Android_Flutter/courses/course5/data/yts_api.dart';
import 'package:Proiecte_Android_Flutter/courses/course5/middleware/app_middleware.dart';
import 'package:Proiecte_Android_Flutter/courses/course5/models/app_state.dart';
import 'package:Proiecte_Android_Flutter/courses/course5/presentation/home_page.dart';
import 'package:Proiecte_Android_Flutter/courses/course5/reducer/reducer.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

void main() {
  final Client client = Client();
  final YtsApi api = YtsApi(client: client);
  final AppMiddleware appMiddleware = AppMiddleware(ytsApi: api);
  final AppState initialState = AppState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: appMiddleware.middleware,
  );

  store.dispatch(GetMovies.start(initialState.page));
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
