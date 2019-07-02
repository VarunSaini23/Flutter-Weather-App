import 'city_model.dart';
import 'list_model.dart';

class OwmFiveDaysModel {
  String cod;
  var message;
  var cnt;
  List<ListModel> list;
  City city;

  OwmFiveDaysModel({this.cod, this.message, this.cnt, this.list, this.city});

  OwmFiveDaysModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = new List<ListModel>();
      json['list'].forEach((v) {
        list.add(new ListModel.fromJson(v));
      });
    }
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }
}
