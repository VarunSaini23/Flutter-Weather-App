import 'package:flutter/material.dart';
import 'package:weather_your/src/blocs/home_vertical_two/home_vertical_two_provider.dart';
import 'package:weather_your/src/screens/home_vertical_two/widgets/forecast_details.dart';
import 'package:weather_your/src/screens/home_vertical_two/widgets/top_details.dart';

class HomeVerticalPageTwo extends StatefulWidget {
  @override
  _HomeVerticalPageTwoState createState() => _HomeVerticalPageTwoState();
}

class _HomeVerticalPageTwoState extends State<HomeVerticalPageTwo> {
  @override
  Widget build(BuildContext context) {
    return HomeVerticalTwoProvider(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            TopDetails(),
            ForecastDetails(),
          ],
        ),
      ),
    );
  }
}
