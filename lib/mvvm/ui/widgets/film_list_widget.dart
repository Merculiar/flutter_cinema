import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/mvvm/vm/film_list_view_model.dart';
import '/mvvm/ui/components/film_item.dart';

typedef Null ItemSelectedCallback(int value);

class FilmListWidget extends StatefulWidget {
  final ItemSelectedCallback onItemSelected;
  final bool showFavorites;
  final bool showHighLight;

  FilmListWidget(this.onItemSelected, this.showFavorites, this.showHighLight);

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
    final filmListViewModel =
        Provider.of<FilmListViewModel>(context, listen: false);
    final films = widget.showFavorites
        ? filmListViewModel.favoriteItems
        : filmListViewModel.films;

    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        return Container(
          color: (widget.showHighLight == true && _selectedIndex == index)
              ? Colors.teal
              : Colors.white,
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              widget.onItemSelected(films[index].id);
              _onSelected(index);
            },
            child: ChangeNotifierProvider.value(
                value: films[index], child: FilmItem()),
          ),
        );
      },
    );
  }
}
