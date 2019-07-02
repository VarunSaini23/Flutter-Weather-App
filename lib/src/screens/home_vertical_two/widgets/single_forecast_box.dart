import 'package:flutter/material.dart';
import 'package:weather_your/src/helpers/date_format.dart';
import 'package:weather_your/src/helpers/farh_to_celcuis.dart';
import 'package:weather_your/src/models/list_model.dart';

class SingleForecastBox extends StatefulWidget {
  @override
  _SingleForecastBoxState createState() => _SingleForecastBoxState();

  final ListModel listModel;

  SingleForecastBox(this.listModel);
}

class _SingleForecastBoxState extends State<SingleForecastBox> {
  final icon_base_url = 'http://openweathermap.org/img/wn';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(8.0),
//        margin: EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(DateFormatter().dateFormatForecast(widget.listModel.dt)),
          Text(DateFormatter().dateFormatForecastTime(widget.listModel.dt),style: TextStyle(fontWeight: FontWeight.w800),),
          Image.network(
            '$icon_base_url/${widget.listModel.weather[0].icon}@2x.png',
            height: 48.0,
            width: 48.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  '${KelvinToCelcius().kelvinToCelcuis(widget.listModel.main.temp)}°'),
              SizedBox(
                width: 8.0,
              ),
              Text('${(widget.listModel.weather[0].main)}'),
            ],
          )
        ],
      ),
    );
  }
}
