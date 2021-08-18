import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '/common/data/models/film.dart';
import '../../data/dummy_data.dart';

class FilmsRepository with ChangeNotifier {
//DUMMY_DATA
  final List<Film> _items = dummyFilms;

  List<Film> get items {
    return [..._items];
  }

  List<Film> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Film findbyId(int id) {
    return _items.firstWhere((film) => film.id == id);
  }

  int get totalAmount {
    return _items.length;
  }

}
