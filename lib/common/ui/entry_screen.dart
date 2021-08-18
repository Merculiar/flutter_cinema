import 'package:flutter/material.dart';

import '../../MVVM/ui/screens/film_overview_screen.dart' as mvvm;

class EntryScreen extends StatelessWidget {
  void selectBLoC(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      mvvm.FilmListScreen.routeName,
    );
  }

  void selectMVVM(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      mvvm.FilmListScreen.routeName,
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinema App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => selectBLoC(context),
              child: Text('BLoC'),
            ),
            ElevatedButton(
              onPressed: () => selectMVVM(context),
              child: Text('MVVM'),
            ),
          ],
        ),
      ),
    );
  }
}
