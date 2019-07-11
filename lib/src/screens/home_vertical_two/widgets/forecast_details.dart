import 'package:flutter/material.dart';
import 'package:weather_your/src/blocs/home_vertical_two/home_vertical_two_provider.dart';
import 'package:weather_your/src/models/list_model.dart';
import 'package:weather_your/src/models/owm_five_days_model.dart';

import 'single_forecast_box.dart';

class ForecastDetails extends StatefulWidget {
  @override
  _ForecastDetailsState createState() => _ForecastDetailsState();
}

class _ForecastDetailsState extends State<ForecastDetails> with AutomaticKeepAliveClientMixin<ForecastDetails>{
  HomeVerticalTwoBloc homeTwoBloc;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    homeTwoBloc = HomeVerticalTwoProvider.of(context);
    homeTwoBloc.getCurrentForecast();

    return SingleChildScrollView(
      child: StreamBuilder(
        stream: homeTwoBloc.currentForecast,
        builder: (context, AsyncSnapshot<OwmFiveDaysModel> snapshot) {
          if (!snapshot.hasData) {
            return RefreshProgressIndicator();
          }

          List<SingleForecastBox> list = [];
          for (var i = 0; i < snapshot.data.cnt; i++) {
            list.add(SingleForecastBox(snapshot.data.list[i]));
          }

          return Container(
            margin: EdgeInsets.all(16.0),
            constraints: BoxConstraints( maxHeight: MediaQuery.of(context).size.height-220),
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(

              ),
              children: <Widget>[
                Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.center,
                    children: list,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
