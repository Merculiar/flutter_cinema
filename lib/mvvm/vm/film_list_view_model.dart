import 'package:flutter/material.dart';

import '../../../common/bl/repository/films_repository.dart';
import '/common/data/models/film.dart';

class FilmListViewModel extends ChangeNotifier {
  var _films = FilmsRepository().items;
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

  // Future<List<Film>?> _films = FilmsRepository().items;

  // Future<List<Film>?> get films {
  //   return _films;
  // }

  // Future<List<Film>> get favoriteItems async {
  //   return _films.then(
  //       (value) => value!.where((prodItem) => prodItem.isFavorite).toList());
  // }

  // Future<Film> findbyId(int id) async {
  //   return _films
  //       .then((value) => value!.firstWhere((film) => film.id == id));
  // }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void toggleFavoriteStatus(Film film) {
    film.isFavorite = film.isFavorite;
    notifyListeners();
  }
}
