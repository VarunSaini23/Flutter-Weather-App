import 'clouds_model.dart';
import 'main_model.dart';
import 'sys_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class ListModel {
  var dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  Sys sys;
  String dtTxt;

  ListModel({this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.sys,
    this.dtTxt});

  ListModel.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }
}