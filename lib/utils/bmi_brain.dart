import 'dart:math';

import 'package:flutter/material.dart';

class BMIBrain {
  BMIBrain({@required this.weight, @required this.height}) {
    this.result = weight / pow(height / 100, 2);
  }
  final int weight;
  final int height;
  double result;

  String getBMI() {
    return result.toStringAsFixed(1);
  }

  String getResult() {
    if (result <= 16.5)
      return 'Anorexia';
    else if (result <= 18.5)
      return 'Thinness';
    else if (result <= 25)
      return 'Normal';
    else if (result <= 30)
      return 'Overweight';
    else if (result <= 35)
      return 'Moderate Obesity';
    else if (result <= 40)
      return 'Severe Obesity';
    else
      return 'Morbid Obesity';
  }

  String getRanges() {
    if (result <= 16.5)
      return '0 - 16.5 kg/m2';
    else if (result <= 18.5)
      return '16.5 - 18.5 kg/m2';
    else if (result <= 25)
      return '18.5 - 25 kg/m2';
    else if (result <= 30)
      return '25 - 30 kg/m2';
    else if (result <= 35)
      return '30 - 35 kg/m2';
    else if (result <= 40)
      return '35 - 40 kg/m2';
    else
      return '40 - 40+ kg/m2';
  }

  String getComments() {
    if (result <= 16.5)
      return 'You have got anorexia, make sure to eat as much as possible from now on!';
    else if (result <= 18.5)
      return 'You need to eat a little more to get a normal body weight';
    else if (result <= 25)
      return 'You have a normal body weight, keep it on!';
    else if (result <= 30)
      return 'Take a little time to exercise your body to aline your weight';
    else if (result <= 35)
      return 'Take time to exercise as your body needs it to be aligned';
    else if (result <= 40)
      return 'Take time to exercise as your body needs it to be aligned';
    else
      return 'Take time to exercise as your body needs it to be aligned';
  }
}
