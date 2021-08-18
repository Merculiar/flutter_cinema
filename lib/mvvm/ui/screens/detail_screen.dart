import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '/MVVM/ui/widgets/film_detail_widget.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-mvvm';
  // final int id;

  // DetailScreen(this.id);
  @override
  Widget build(BuildContext context) {
    var isLandscape = false;
    final id = ModalRoute.of(context)!.settings.arguments as int;

    Widget _buildLandscape() {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
      return Container();
    }

    Widget _buildPortait() {
      return DetailWidget(id);
    }

    (MediaQuery.of(context).orientation == Orientation.landscape)
        ? isLandscape = true
        : isLandscape = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: isLandscape ? _buildLandscape() : _buildPortait(),
    );
  }
}
