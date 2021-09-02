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

    factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json["Id"],
      title: json["Title"], 
      description: json["Description"]
    );
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
