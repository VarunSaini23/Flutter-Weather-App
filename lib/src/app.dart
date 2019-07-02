import 'package:flutter/material.dart';
import 'package:weather_your/src/screens/home/home_screen.dart';

import 'package:weather_your/src/blocs/home/home_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      title: "AI Weather",
      theme: ThemeData(
          fontFamily: 'OpenSans',
          textTheme: TextTheme(
            body1: TextStyle(color: Colors.white),
          )),
    );
  }
}
