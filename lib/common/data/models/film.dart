import 'package:flutter/cupertino.dart';

class Film with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  bool isFavorite;

  Film({
    required this.id,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
