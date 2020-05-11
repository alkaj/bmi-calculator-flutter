import 'dart:math';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/components/reusable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'utils/bmi_brain.dart';
import 'components/first_row_child.dart';
import 'pages/input_page.dart';

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
