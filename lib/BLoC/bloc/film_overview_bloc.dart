import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilmOverviewBloc {
  //var _showOnlyFavorites = false;
  bool _isLandscape = false;
  int _selectedId = 1;
  bool _showHighLight = false;
  bool _showOnlyFavorites = false;

  bool get isLandscape => _isLandscape;
  bool get showHighLight => _showHighLight;
  int get selectedId => _selectedId;
  bool get showOnlyFavorites => _showOnlyFavorites;

  void setHighLight(bool val) => _showHighLight = val;
  void setOnlyFavorites(bool val) => _showOnlyFavorites = val;

  final filmStreamController = StreamController<int>.broadcast();

  Stream<int> get getFilms => filmStreamController.stream;

  void onOrientationChange(bool land) {
    if (_isLandscape == land) {
      return;
    }
    _isLandscape = land;
  }

  bool _locktouch = false;

  void setSelectedId(BuildContext context, String name, int id) {
    if (_locktouch) return;
    _locktouch = true;
    // if (_selectedId == id) {
    //   return;
    // }
    _selectedId = id;
    if (_isLandscape == false) {
      Navigator.pushNamed(context, name, arguments: id);
    }

    filmStreamController.sink.add(_selectedId);
    _locktouch = false;
  }

  void dispose() {
    filmStreamController.close(); // close our StreamController
  }
}
