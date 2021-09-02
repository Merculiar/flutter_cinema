class FilmDetailBloc {
  bool _isLandscape = false;

  bool get isLandscape => _isLandscape;

  void onOrientationChange(bool land) {
    if (_isLandscape == land) {
      return;
    }
    _isLandscape = land;
  }
}
