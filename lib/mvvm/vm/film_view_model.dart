import 'package:flutter/foundation.dart';

import '/common/data/models/film.dart';

class FilmViewModel with ChangeNotifier {

  final Film film;

  FilmViewModel(this.film);

  String get title {
    return this.film.title;
  }

  String get description {
    return this.film.description;
  }

  int get id {
    return this.film.id;
  }

  bool get isFavorite {
    return this.film.isFavorite;
  }
}
