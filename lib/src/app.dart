import 'package:flutter/material.dart';
import 'package:weather_your/src/screens/demo_screen.dart';
import 'package:weather_your/src/screens/home/home_screen.dart';

import 'package:weather_your/src/blocs/home/home_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes,
      title: "AL Weather",
      theme: ThemeData(
          fontFamily: 'OpenSans',
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.white),
          )),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
//        HomeBloc bloc = HomeProvider.of(context);
//        bloc.getCurrentWeather();
        return HomeScreen();
      });
    } else {
      return MaterialPageRoute(
          builder: (context) {
            return DemoScreen();
          }
      );
    }
  }

}
