import 'package:intl/intl.dart';

class DateFormatter{

  String dateFormat(int timeStamp){
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var formatter = new DateFormat('EEEE, MMM dd');
    String formatted = formatter.format(date);
    return formatted.toUpperCase();
  }

  String dateFormatForecast(int timeStamp){
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var formatter = new DateFormat('E, MMMd');
    String formatted = formatter.format(date);
    return formatted.toUpperCase();
  }

  String dateFormatForecastTime(int timeStamp){
    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    var formatter = new DateFormat('h:m a');
    String formatted = formatter.format(date);
    return formatted.toUpperCase();
  }


}
