import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/data/models/film.dart';

import '/Bloc/ui/components/film_item.dart';
import '/BloC/bloc/film_list_bloc.dart';

typedef Null ItemSelectedCallback(int value);

class FilmListWidget extends StatefulWidget {
  final ItemSelectedCallback onItemSelected;
  final bool showFavorites;
  final bool showhilght;

  FilmListWidget(this.onItemSelected, this.showFavorites, this.showhilght);

  @override
  _FilmListWidgetState createState() => _FilmListWidgetState();
}

class _FilmListWidgetState extends State<FilmListWidget> {
  FilmListBloc _filmListBloc = FilmListBloc();
  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

 // @override
  // void initState() {
  //   _filmListBloc.initData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Film>?>(
        initialData: [],
        stream: _filmListBloc.getFilms,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                color: (widget.showhilght == true && _selectedIndex == index) ? Colors.teal : Colors.white,
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                    onTap: () {
                      widget.onItemSelected(snapshot.data![index].id);
                      _onSelected(index);
                    },
                    child: FilmItem(
                      film: snapshot.data![index],
                    )),
              );
            },
          );
        });
  }
}
