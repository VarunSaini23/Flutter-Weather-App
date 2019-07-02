import 'package:flutter/material.dart';

class LowerHome extends StatefulWidget {
  @override
  _LowerHomeState createState() => _LowerHomeState();
}

class _LowerHomeState extends State<LowerHome> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _changeOpacity();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 25.0,
        ),
        Icon(
          //TODO: Animate this icon
            Icons.keyboard_arrow_down,
            color: Colors.white,
        ),
      ],
    );
  }
}
