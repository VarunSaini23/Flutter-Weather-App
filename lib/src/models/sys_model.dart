class Sys {
  var message;
  String country;
  var sunrise;
  var sunset;

  Sys({this.message, this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}