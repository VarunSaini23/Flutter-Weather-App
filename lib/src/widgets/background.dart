import 'package:flutter/material.dart';
import 'package:weather_your/src/blocs/home/home_provider.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({this.child});

  final thunderstorm1 = const Color(0xff335672);
  final thunderstorm2 = const Color(0xff1e324b);
  final snow1 = const Color(0xffbce3fb);
  final snow2 = const Color(0xffa5c9fd);
  final clear1 = const Color(0xfff5ca67);
  final clear2 = const Color(0xfffca184);
  final rain1 = const Color(0xff616161);
  final rain2 = const Color(0xff9BC5C3);
  final cloud1 = const Color(0xffDAE2F8);
  final cloud2 = const Color(0xffD6A4A4);
  final drizzle1 = const Color(0xff8caeab);
  final drizzle2 = const Color(0xffbacecd);

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc;
    homeBloc = HomeProvider.of(context);
    return StreamBuilder(
        stream: homeBloc.currentWeather,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 30, 50, 75),
                  Color.fromARGB(255, 51, 86, 114),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: child,
            );
          }

          Color color1;
          Color color2;

          switch ((snapshot.data.weather[0].main).toLowerCase()) {
            case "thunderstorm":
              color1 = thunderstorm1;
              color2 = thunderstorm2;
              break;
            case "drizzle":
              color1 = drizzle1;
              color2 = drizzle2;
              break;
            case "rain":
              color1 = rain1;
              color2 = rain2;
              break;
            case "snow":
              color1 = snow1;
              color2 = snow2;
              break;
            case "clear":
              color1 = clear1;
              color2 = clear2;
              break;
            case "clouds":
              color1 = cloud1;
              color2 = cloud2;
              break;
            default:
              color1 = Color.fromARGB(255, 30, 50, 75);
              color2 = Color.fromARGB(255, 51, 86, 114);
          }

          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: child,
          );
        });
  }
}
