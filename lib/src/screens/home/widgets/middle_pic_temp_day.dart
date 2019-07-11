import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_your/src/blocs/home/home_provider.dart';
import 'package:weather_your/src/helpers/date_format.dart';
import 'package:weather_your/src/helpers/farh_to_celcuis.dart';
import 'package:weather_your/src/models/owm_current_weather_model.dart';
import 'package:after_layout/after_layout.dart';

import 'dart:io';

import 'package:weather_your/src/screens/home/home_screen.dart';

class MiddleHome extends StatefulWidget {
  @override
  _MiddleHomeState createState() => _MiddleHomeState();
}

class _MiddleHomeState extends State<MiddleHome> with AutomaticKeepAliveClientMixin<MiddleHome>{
  HomeBloc homeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    homeBloc = HomeProvider.of(context);
    homeBloc.getCurrentWeather();
    homeBloc.getCurrentPlace();
    return Column(
      children: <Widget>[
        SizedBox(
          height: 25.0,
        ),
        CityImage(
          homeBloc: homeBloc,
        ),
        SizedBox(height: 25.0),
        TempDate(
          homeBloc: homeBloc,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CityImage extends StatelessWidget {
  final HomeBloc homeBloc;

  CityImage({this.homeBloc});

  final icon_base_url = 'http://openweathermap.org/img/wn';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: homeBloc.currentWeather,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return RefreshProgressIndicator();
        }
        return Container(
          height: 250.0,
          width: 250.0,
//          child: Image.network(
//            '$icon_base_url/${snapshot.data.weather[0].icon}@2x.png',
//            fit: BoxFit.fill,
//            color: Colors.white,
//          ),
          child: Image.asset(
            'assets/images/delhi.png',
            fit: BoxFit.fill,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

class TempDate extends StatelessWidget {
  final HomeBloc homeBloc;

  TempDate({this.homeBloc});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(color: Colors.white);
    TextStyle textStyleDate =
        TextStyle(color: Colors.white, fontWeight: FontWeight.w800);
    TextStyle textStyleTemp = TextStyle(
      color: Colors.white,
      fontSize: 96.0,
      fontWeight: FontWeight.w400,
    );

    return StreamBuilder(
      stream: homeBloc.currentWeather,
      builder: (context, AsyncSnapshot<OwmCurrentWeatherModel> snapshot) {
        if (!snapshot.hasData) {
          return RefreshProgressIndicator();
        }
        return Column(
          children: <Widget>[
            Text(
              '${KelvinToCelcius().kelvinToCelcuis(snapshot.data.main.temp)}°',
              style: textStyleTemp,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${(snapshot.data.weather[0].main).toUpperCase()}',
              style: textStyle,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '${DateFormatter().dateFormat(snapshot.data.dt)}',
              style: textStyleDate,
            ),
          ],
        );
      },
    );
  }
}
