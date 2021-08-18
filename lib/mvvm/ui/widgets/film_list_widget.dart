import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/data/models/film.dart';
import '/mvvm/vm/film_list_view_model.dart';

typedef Null ItemSelectedCallback(int value);

class FilmListWidget extends StatefulWidget {
  final ItemSelectedCallback onItemSelected;
  final bool showFavorites;

  FilmListWidget(
    this.onItemSelected,
    this.showFavorites,
  );

  @override
  _FilmListWidgetState createState() => _FilmListWidgetState();
}

class _FilmListWidgetState extends State<FilmListWidget> {
  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final filmsData = Provider.of<FilmListViewModel>(context, listen: false);
    final films =
        widget.showFavorites ? filmsData.favoriteItems : filmsData.films;

    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: films[index],
          child: Container(
            color: _selectedIndex == index ? Colors.teal : Colors.white,
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {
                widget.onItemSelected(films[index].id);
                _onSelected(index);
              },
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.5),
                      child: Text(
                        films[index].title,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Consumer<Film>(
                      builder: (ctx, film, _) => IconButton(
                        icon: Icon(
                            film.isFavorite ? Icons.star : Icons.star_border),
                        onPressed: film.toggleFavoriteStatus,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
