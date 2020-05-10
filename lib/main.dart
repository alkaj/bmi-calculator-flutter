import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'first_row_child.dart';

const backgroundColor = Color(0xFF0E1020);
const blockOnColor = Color(0xFF1D1E33);
const blockOffColor = Color(0xFF0C0D22);
const bottomHeight = 60.0;
const bottomColor = Colors.pink;
final bottomColorTrans = Color(0x66ffc0cb);

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: backgroundColor,
      ),
      home: Input(),
    );
  }
}

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  Gender gender;
  int height = 160;
  int weight = 50;
  int age = 14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableWidget(
                      onPress: () {
                        setState(() {
                          gender = Gender.male;
                        });
                      },
                      cardChild: FirstRowChild(
                          icon: FontAwesomeIcons.mars, text: 'MALE'),
                      color:
                          gender == Gender.male ? blockOnColor : blockOffColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableWidget(
                      onPress: () {
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                      cardChild: FirstRowChild(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                      color: gender == Gender.female
                          ? blockOnColor
                          : blockOffColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableWidget(
                color: blockOnColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kCardTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumbersStyle,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          thumbColor: bottomColor,
                          overlayColor: bottomColorTrans),
                      child: Slider(
                        onChanged: (size) {
                          setState(() {
                            height = size.round();
                          });
                        },
                        value: height.toDouble(),
                        min: 60.0,
                        max: 210.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableWidget(
                      color: blockOnColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kCardTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumbersStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  fillColor: Color(0xFF4C5065),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: Color(0xFF4C5065),
                                    ),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1.0,
                              ),
                              Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  fillColor: Color(0xFF4C5065),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: Color(0xFF4C5065),
                                    ),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableWidget(
                      color: blockOnColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kCardTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumbersStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  fillColor: Color(0xFF4C5065),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: Color(0xFF4C5065),
                                    ),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    size: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 1.0,
                              ),
                              Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  fillColor: Color(0xFF4C5065),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: Color(0xFF4C5065),
                                    ),
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                text: 'CALCULATE BMI',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Result()));
                }),
          ],
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.text, @required this.onPressed});
  final Function onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: bottomHeight,
        color: bottomColor,
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
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
                  Text('Normal',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  Text('22.1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold)),
                  Column(
                    children: <Widget>[
                      Text(
                        'Normal BMI range:',
                        style: TextStyle(
                          color: Color(0xff8A92AD),
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        '18,5 - 25 kg/m2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'You have a normal body weight. Good job!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
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

enum Gender { male, female }
