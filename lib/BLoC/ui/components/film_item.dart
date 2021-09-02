import 'package:flutter/material.dart';
import '/common/data/models/film.dart';

class FilmItem extends StatelessWidget {
  const FilmItem({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.5),
            child: Text(
              film.title,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          IconButton(
            icon: Icon(film.isFavorite ? Icons.star : Icons.star_border),
            onPressed: film.toggleFavoriteStatus,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
