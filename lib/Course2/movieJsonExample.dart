import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final http.Response response = await http.get('https://yts.mx/api/v2/list_movies.json');
  final Map<String, dynamic> responseMap = jsonDecode(response.body);
  //print(response.body);
  print(responseMap['status']);
  print(responseMap['data']['movies'][0]['title']);
}

//String firstMovie = await response['data']['movies'][0]['title'];
