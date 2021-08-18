import 'package:flutter/material.dart';

import '/MVVM/ui/widgets/film_detail_widget.dart';
import '/MVVM/ui/widgets/film_list_widget.dart';
import '/MVVM/ui/screens/detail_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class FilmListScreen extends StatefulWidget {
  static const routeName = '/film-list-provider';

  @override
  _FilmListScreenState createState() => _FilmListScreenState();
}

class _FilmListScreenState extends State<FilmListScreen> {
  var _selectedId = 1;
  var _isLandscape = false;
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Films(MVVM)'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
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
        (MediaQuery.of(context).orientation == Orientation.landscape)
            ? _isLandscape = true
            : _isLandscape = false;
        return Row(children: <Widget>[
          Expanded(
            child: FilmListWidget((id) {
              if (_isLandscape) {
                setState(() {
                  _selectedId = id;
                });
              } else {
                _selectedId = id;
                Navigator.pushNamed(context, DetailScreen.routeName,
                    arguments: _selectedId);
              }
            }, _showOnlyFavorites),
          ),
          _isLandscape
              ? Expanded(
                  flex: 2,
                  child: DetailWidget(_selectedId),
                )
              : Container(),
        ]);
      }),
    );
  }
}
