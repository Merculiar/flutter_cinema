import 'dart:convert';

import '/common/data/models/film.dart';
import 'package:http/http.dart' as http;
//import '../../data/dummy_data.dart';

class Webservice {
  Future<List<Film>> fetchMovies(String keyword) async {
    String url = 'http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538';
    print(url);
    final response = await http.get(url as Uri);
    print(response);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["Search"];
      return json.map((film) => Film.fromJson(film)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
