import 'package:flutter/material.dart';

import '../utils/constants.dart';

class FirstRowChild extends StatelessWidget {
  final IconData icon;
  final String text;

  FirstRowChild({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
          color: Color(0xFF8D8E98),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          text,
          style: kCardTextStyle,
        )
      ],
    );
  }
}
