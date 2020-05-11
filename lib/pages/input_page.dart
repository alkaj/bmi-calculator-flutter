import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/components/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../utils/constants.dart';
import '../components/first_row_child.dart';
import '../utils/gender.dart';

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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                                height: height,
                                weight: weight,
                              )));
                }),
          ],
        ),
      ),
    );
  }
}
