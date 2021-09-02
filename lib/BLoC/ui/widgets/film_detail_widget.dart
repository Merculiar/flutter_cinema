import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/data/dummy_data.dart';

class FilmDetailWidget extends StatelessWidget {
  static const routeName = '/detail-widget-Bloc';
  final int id;

  FilmDetailWidget(
    this.id,
  );

  @override
  Widget build(BuildContext context) {
    var _film = dummyFilms[id - 1];
    return Container(
      color: Theme.of(context).accentColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              _film.title,
              style: TextStyle(fontSize: 36.0, color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              _film.description,
              style: TextStyle(fontSize: 36.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
