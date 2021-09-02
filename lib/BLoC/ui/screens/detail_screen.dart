import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '/BLoC/bloc/film_detail_bloc.dart';
import '/BLoC/ui/screens/film_overview_screen.dart';
import '/BloC/ui/widgets/film_detail_widget.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-bloc';

  @override
  Widget build(BuildContext context) {
    FilmDetailBloc filmDetailBloc = FilmDetailBloc();
    final id = ModalRoute.of(context)!.settings.arguments as int;

    Widget _buildLandscape() {
      print("lol");
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Navigator.popUntil(
            context, ModalRoute.withName(FilmListScreen.routeName));
      });
      return Container();
    }

    Widget _buildPortait() {
      return FilmDetailWidget(id);
    }

    filmDetailBloc.onOrientationChange(
        MediaQuery.of(context).orientation == Orientation.landscape);

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: filmDetailBloc.isLandscape ? _buildLandscape() : _buildPortait(),
    );
  }
}
