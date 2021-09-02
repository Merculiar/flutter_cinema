import 'package:flutter/material.dart';

import '../../bloc/film_overview_bloc.dart';
import '/Bloc/ui/widgets/film_detail_widget.dart';
import '/Bloc/ui/widgets/film_list_widget.dart';
import '/Bloc/ui/screens/detail_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class FilmListScreen extends StatefulWidget {
  static const routeName = '/film-list-bloc';

  @override
  _FilmListScreenState createState() => _FilmListScreenState();
}

class _FilmListScreenState extends State<FilmListScreen> {
  FilmOverviewBloc filmOverviewBloc = FilmOverviewBloc();
  var a = 1;

  Widget _buildPortait() {
    filmOverviewBloc.setHighLight(false);
    print("Portait overview");
    return Row(children: <Widget>[
      Expanded(
        child: FilmListWidget((id) {
          filmOverviewBloc.setSelectedId(context, DetailScreen.routeName, id);
        }, filmOverviewBloc.showOnlyFavorites, filmOverviewBloc.showHighLight),
      ),
      Container(),
    ]);
  }

  Widget _buildLandscape() {
    filmOverviewBloc.setHighLight(true);
    print("landscape overview");
    return Row(children: <Widget>[
      Expanded(
        child: FilmListWidget((id) {
          filmOverviewBloc.setSelectedId(context, DetailScreen.routeName, id);
        }, filmOverviewBloc.showOnlyFavorites, filmOverviewBloc.showHighLight),
      ),
      Expanded(
          flex: 2,
          child: StreamBuilder<int>(
            initialData: filmOverviewBloc.selectedId,
            stream: filmOverviewBloc.getFilms,
            builder: (context, snapshot) {
              return FilmDetailWidget(snapshot.data!);
            },
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Films(BLoC)'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  filmOverviewBloc.setHighLight(true);
                } else {
                  filmOverviewBloc.setHighLight(false);
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        filmOverviewBloc.onOrientationChange(
            MediaQuery.of(context).orientation == Orientation.landscape);
        // print("changed");
        return filmOverviewBloc.isLandscape
            ? _buildLandscape()
            : _buildPortait();
      }),
    );
  }
}
