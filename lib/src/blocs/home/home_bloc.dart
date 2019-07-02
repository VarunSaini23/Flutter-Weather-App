import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_your/src/models/owm_current_weather_model.dart';
import 'package:weather_your/src/network/repository.dart';

class HomeBloc {

  final _getWeather = PublishSubject<OwmCurrentWeatherModel>();
  final _getCity = PublishSubject<Address>();
  final repository = Repository();

  Observable<OwmCurrentWeatherModel> get currentWeather => _getWeather.stream;
  Observable<Address> get currentPosition => _getCity.stream;

  getCurrentWeather() async{
    Position position = await repository.getCurrntLatLong();
    OwmCurrentWeatherModel item = await repository.getCurrentWeather(position.latitude,position.longitude);
    _getWeather.sink.add(item);
    return item;
  }

  getCurrentPlace() async{
    Position position = await repository.getCurrntLatLong();
    var place = await repository.getCurrentPlace(position.latitude,position.longitude);
    _getCity.sink.add(place);
  }




  dispose(){
    _getWeather.close();
    _getCity.close();
  }

}