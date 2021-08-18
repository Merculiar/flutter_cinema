import 'package:flutter/material.dart';

import '../../../common/bl/repository/films_repository.dart';
import '/common/data/models/film.dart';

class FilmListViewModel extends ChangeNotifier {
  var _films = FilmsRepository().items;
 // var _showFavoritesOnly = false;

  List<Film> get films {
    return [..._films];
  }

  List<Film> get favoriteItems {
    return _films.where((prodItem) => prodItem.isFavorite).toList();
  }

  Film findbyId(int id) {
    return _films.firstWhere((film) => film.id == id);
  }

  int get totalAmount {
    return _films.length;
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void toggleFavoriteStatus(int id) {
    _films[id].isFavorite = !_films[id].isFavorite;
    notifyListeners();
  }
}
