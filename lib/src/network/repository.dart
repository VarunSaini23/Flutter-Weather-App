import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_your/src/models/owm_current_weather_model.dart';
import 'package:weather_your/src/models/owm_five_days_model.dart';
import 'package:weather_your/src/network/weather_api_provider.dart';

class Repository{

  Future<OwmCurrentWeatherModel> getCurrentWeather(double lat, double long) async {
    print("in getWeather");
    return WeatherApiProvider().getCurrentWeather(lat, long);
  }

  Future<Position> getCurrntLatLong() {
    return WeatherApiProvider().getCurrentLatLong();
  }

  Future<Address> getCurrentPlace(double latitude, double longitude) {
    return WeatherApiProvider().getCurrentPlace(latitude,longitude);
  }

  Future<OwmFiveDaysModel> getCurrentForecast(double latitude, double longitude) {
    return WeatherApiProvider().getCurrentForeCast(latitude, longitude);
  }

}