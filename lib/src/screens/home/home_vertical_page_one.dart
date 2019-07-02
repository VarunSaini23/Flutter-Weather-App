import 'package:flutter/material.dart';
import 'package:weather_your/src/blocs/home/home_provider.dart';

import 'widgets/lower_arrows.dart';
import 'widgets/middle_pic_temp_day.dart';
import 'widgets/top_app_bar.dart';

class HomeVerticalPageOne extends StatefulWidget {
  @override
  _HomeVerticalPageOneState createState() => _HomeVerticalPageOneState();
}

class _HomeVerticalPageOneState extends State<HomeVerticalPageOne> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(children: <Widget>[
          TopAppBar(),
          MiddleHome(),
          LowerHome(),
        ]),
      ),
    );
  }
}
