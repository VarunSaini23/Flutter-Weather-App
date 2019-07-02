import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_your/src/blocs/home/home_bloc.dart';
import 'package:weather_your/src/blocs/home/home_provider.dart';
import 'package:weather_your/src/models/owm_current_weather_model.dart';
import 'package:weather_your/src/screens/home/widgets/lower_arrows.dart';

import 'package:weather_your/src/screens/home_vertical_two/home_vertical_page_two.dart';
import 'home_vertical_page_one.dart';
import 'widgets/middle_pic_temp_day.dart';
import 'widgets/top_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(),
      body: HomeProvider(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 30, 50, 75),
              Color.fromARGB(255, 51, 86, 114),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: PageView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              HomeVerticalPageOne(),
              HomeVerticalPageTwo(),
            ],
          ),
        ),
      ),
    );
  }
}
