import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/common/data/models/film.dart';
import '../../data/dummy_data.dart';

class FilmsRepository with ChangeNotifier {
  Future<List<Film>?> getFilms() async {
    var dbData = await _getDbData();
    if (dbData == null || dbData.isEmpty) {
      dbData = await _getNetworkData();
    }
    return dbData;
  }

  void afc() {
    Future.delayed(Duration.zero).then((_) {
      getFilms();
    });
  }

  Future<List<Film>> get favoriteItems async {
    return getFilms().then(
        (value) => value!.where((prodItem) => prodItem.isFavorite).toList());
  }

  Future<List<Film>> findbyId(int id) async {
    return getFilms().then(
        (value) => value!.where((prodItem) => prodItem.id == id).toList());
  }

  Future<List<Film>?> _getDbData() async {
    return dummyFilms;
  }

  Future<List<Film>?> _getNetworkData() async {
    return dummyFilms;
  }

  List<Film> _items = dummyFilms;

  List<Film> get items {
    return _items;
  }
}
