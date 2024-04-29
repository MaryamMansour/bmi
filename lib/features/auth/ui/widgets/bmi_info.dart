import 'package:flutter/material.dart';
import 'package:bmi/core/theming/colors.dart';

import 'bmi_chart.dart';

class BmiInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome to the BMI App!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: ColorsManager.gray,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Track your BMI and stay healthy.',
            style: TextStyle(
              fontSize: 16.0,
              color: ColorsManager.gray,
            ),
          ),
          SizedBox(height: 20.0),
          BMIChart(),
        ],
      ),
    );
  }


}
