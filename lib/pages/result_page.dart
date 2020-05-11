import 'package:flutter/material.dart';

import '../utils/bmi_brain.dart';
import '../components/bottom_button.dart';
import '../utils/constants.dart';

class Result extends StatelessWidget {
  BMIBrain brain;
  Result({@required this.weight, @required this.height}) {
    brain = BMIBrain(weight: weight, height: height);
  }
  final int weight;
  final int height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: blockOnColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(brain.getResult(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  Text(brain.getBMI(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold)),
                  Column(
                    children: <Widget>[
                      Text(
                        '${brain.getResult()} BMI range:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff8A92AD),
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        brain.getRanges(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      brain.getComments(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: blockOffColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    child: Text(
                      'SAVE RESULT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              text: 'RE-CALCULATE BMI',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
