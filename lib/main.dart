import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//COMMON
import 'common/ui/entry_screen.dart';

//MVVM IMPORTS
import 'mvvm/vm/film_list_view_model.dart';
import 'mvvm/ui/screens/film_overview_screen.dart' as mvvm;
import 'mvvm/ui/screens/detail_screen.dart' as mvvm;

//BloC IMPORTS
import 'BloC/ui/screens/film_overview_screen.dart' as bloc;
import 'BloC/ui/screens/detail_screen.dart' as bloc;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => FilmListViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Cinema App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.pinkAccent,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => EntryScreen(),
          //MVVM ROUTES
          mvvm.FilmListScreen.routeName: (ctx) => mvvm.FilmListScreen(),
          mvvm.DetailScreen.routeName: (ctx) => mvvm.DetailScreen(),
          //BloC ROUTES
          bloc.FilmListScreen.routeName: (ctx) => bloc.FilmListScreen(),
          bloc.DetailScreen.routeName: (ctx) => bloc.DetailScreen(),
        },
      ),
    );
  }
}
