import 'package:flutter/material.dart';
import 'package:flutter_cinema/mvvm/vm/film_list_view_model.dart';
import 'package:provider/provider.dart';

import '/mvvm/vm/film_list_view_model.dart';

class DetailWidget extends StatelessWidget {
 static const routeName = '/detail-widget-mvvm';
  final int id;

  DetailWidget(
    this.id,
  );

  @override
  Widget build(BuildContext context) {
    final film = Provider.of<FilmListViewModel>(context, listen: false).findbyId(id);
    return Container(
      color: Theme.of(context).accentColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              film.title,
              style: TextStyle(fontSize: 36.0, color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              film.description,
              style: TextStyle(fontSize: 36.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
