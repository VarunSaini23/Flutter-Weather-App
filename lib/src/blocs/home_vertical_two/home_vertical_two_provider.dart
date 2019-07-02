import 'package:flutter/material.dart';

import 'home_vertical_two_bloc.dart';
export 'home_vertical_two_bloc.dart';
export 'package:weather_your/src/blocs/home/home_bloc.dart';

class HomeVerticalTwoProvider extends InheritedWidget {
  final HomeVerticalTwoBloc bloc;

  HomeVerticalTwoProvider({Key key, Widget child})
      : bloc = HomeVerticalTwoBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static HomeVerticalTwoBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(HomeVerticalTwoProvider)
    as HomeVerticalTwoProvider)
        .bloc;
  }
}
