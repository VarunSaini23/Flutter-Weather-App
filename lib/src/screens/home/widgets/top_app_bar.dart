import 'package:flutter/material.dart';
import 'package:weather_your/src/blocs/home/home_provider.dart';

class TopAppBar extends StatefulWidget {
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  HomeBloc homeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeBloc = HomeProvider.of(context);
    homeBloc.getCurrentWeather();
    homeBloc.getCurrentPlace();
    return Column(
      children: <Widget>[
        SizedBox(height: 50.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.format_align_left,color: Colors.white,),
              CityName(
                homeBloc: homeBloc,
              ),
              Icon(Icons.settings,color: Colors.white,),
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
          return Text(snapshot.data.locality,style: textStyle,);
        } else {
          return RefreshProgressIndicator();
        }
      },
    );
  }
}
