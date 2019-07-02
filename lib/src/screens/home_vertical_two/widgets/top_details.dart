import 'package:flutter/material.dart';
import 'package:weather_your/src/blocs/home/home_provider.dart';
import 'package:weather_your/src/helpers/date_format.dart';
import 'package:weather_your/src/helpers/farh_to_celcuis.dart';
import 'package:weather_your/src/models/owm_current_weather_model.dart';

class TopDetails extends StatefulWidget {
  @override
  _TopDetailsState createState() => _TopDetailsState();
}

class _TopDetailsState extends State<TopDetails> {
  HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    homeBloc = HomeProvider.of(context);
    homeBloc.getCurrentWeather();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: CommonPHWLWidget(
                  homeBloc: homeBloc,
                  iconPath: "assets/images/pressure.png",
                  Name: "Pressure",
                  units: "mb",
                ),
              ),
              VerticalDivider(
                color: Colors.white,
                width: 1.0,
              ),
              Expanded(
                child: CommonPHWLWidget(
                  homeBloc: homeBloc,
                  iconPath: "assets/images/humidity.png",
                  Name: "Humidity",
                  units: "%",
                ),
              ),
            ],
          ),
          Divider(
            height: 1.0,
            color: Colors.white,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CommonPHWLWidget(
                  homeBloc: homeBloc,
                  iconPath: "assets/images/wind.png",
                  Name: "Wind Speed",
                  units: "km/hr",
                ),
              ),
              Expanded(
                child: CommonPHWLWidget(
                  homeBloc: homeBloc,
                  iconPath: "assets/images/wind_angle.png",
                  Name: "Wind Angle",
                  units: "°",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CommonPHWLWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  final String Name;
  final String iconPath;
  String units;

  var value;

  CommonPHWLWidget({this.homeBloc, this.Name, this.iconPath,this.units});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: homeBloc.currentWeather,
        builder: (context, AsyncSnapshot<OwmCurrentWeatherModel> snapshot) {
          if (!snapshot.hasData) {
            return RefreshProgressIndicator();
          }
          switch (Name) {
            case "Pressure":
              value = snapshot.data.main.pressure;
              break;
            case "Humidity":
              value = snapshot.data.main.humidity;
              break;
            case "Wind Speed":
              value = snapshot.data.wind.speed;
              break;
            case "Wind Angle":
              value = snapshot.data.wind.deg;
              break;
          }
          return Container(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(Name, style: TextStyle(color: Colors.white),),
                    Text("${value} $units", style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800),)
                  ],
                ),
                Image.asset(iconPath, height: 36.0, width: 36.0,),
              ],
            ),
          );
        });
  }
}