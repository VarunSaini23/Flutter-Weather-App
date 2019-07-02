import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_your/src/models/owm_five_days_model.dart';
import 'package:weather_your/src/network/repository.dart';

class HomeVerticalTwoBloc {
//
  final _getForecast = PublishSubject<OwmFiveDaysModel>();
  final repository = Repository();
//
  Observable<OwmFiveDaysModel> get currentForecast => _getForecast.stream;
//
  getCurrentForecast() async{
    Position position = await repository.getCurrntLatLong();
    OwmFiveDaysModel item = await repository.getCurrentForecast(position.latitude,position.longitude);
    _getForecast.sink.add(item);
    return item;
  }
//  dispose(){
//    _getWeather.close();
//    _getCity.close();
//  }

}