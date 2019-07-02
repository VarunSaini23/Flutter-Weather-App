class Main {
  var temp;
  var pressure;
  var humidity;
  var tempMin;
  var tempMax;
  var seaLevel;
  var grndLevel;

  Main({this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
    this.seaLevel,
    this.grndLevel});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }

}