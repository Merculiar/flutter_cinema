import 'dart:async';

import '/common/data/models/film.dart';
import '/common/bl/repository/films_repository.dart';

class FilmListBloc {
  FilmListBloc() {
    initData();
  }

  final filmsRepository = FilmsRepository();

  StreamController<List<Film>?> filmStreamController =
      StreamController<List<Film>?>.broadcast();

  Stream<List<Film>?> get getFilms => filmStreamController.stream;

  void initData() async {
    var _results = await filmsRepository.getFilms();
    filmStreamController.add(_results);
  }

  void onListItemSelected(id) async {
    final _results = await filmsRepository.findbyId(id);
    filmStreamController.add(_results);
  }

  void dispose() {
    filmStreamController.close(); // close our StreamController
  }
}
