import 'dart:convert';

import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_your/src/models/owm_current_weather_model.dart';
import "package:http/http.dart" show Client;
import 'package:weather_your/src/models/owm_five_days_model.dart';

class WeatherApiProvider {
  final weather_api_root = "https://api.openweathermap.org/data/2.5";
  final weather_api_appId = '16e01e6f83e117ec6b5ddc55d2abcca3';

  Client client = Client();

  Future<OwmCurrentWeatherModel> getCurrentWeather(
      double lat, double long) async {
    final response = await client
        .get("$weather_api_root/weather?lat=$lat&lon=$long&appId=$weather_api_appId");
    final item = OwmCurrentWeatherModel.fromJson(json.decode(response.body));
    return item;
  }

  Future<Position> getCurrentLatLong() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;

  }

  Future<Address> getCurrentPlace(double latitude, double longitude) async {
    final coordinates = new Coordinates(latitude,longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address first = addresses.first;
    return first;
  }

  Future<OwmFiveDaysModel> getCurrentForeCast(double latitude, double longitude) async {
    final response = await client
        .get("$weather_api_root/forecast?lat=$latitude&lon=$longitude&appId=$weather_api_appId");
    final item = OwmFiveDaysModel.fromJson(json.decode(response.body));
    return item;
  }

}
