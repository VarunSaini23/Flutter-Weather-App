import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_your/src/blocs/home/home_provider.dart';

class TopAppBar extends StatefulWidget {
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    homeBloc = HomeProvider.of(context);
    homeBloc.getCurrentPlace();
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  padding:EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: InkWell(
                    child: Image.asset('assets/images/logo.png',width: 24.0,height: 24.0,),
                    onTap: () {
                      Navigator.pushNamed(context, '/demo');
                    },
                  ),
                ),
              ),
              CityName(
                homeBloc: homeBloc,
              ),
              InkWell(
                onTap: () {
                  homeBloc.getCurrentWeather();
                  homeBloc.getCurrentPlace();
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CityName extends StatelessWidget {
  final HomeBloc homeBloc;

  CityName({this.homeBloc});

  TextStyle textStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: homeBloc.currentPosition,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data.locality,
            style: textStyle,
          );
        } else {
          return RefreshProgressIndicator();
        }
      },
    );
  }
}
