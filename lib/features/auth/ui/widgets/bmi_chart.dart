import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIChart  extends StatelessWidget {
  const BMIChart({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Underweight',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red, // Change color to red for Underweight
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  '<18',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Change color to red for Underweight
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Normal',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.green, // Change color to green for Normal
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  '18 - 25',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Change color to green for Normal
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Overweight',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.orange, // Change color to orange for Overweight
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  '25 - 29',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange, // Change color to orange for Overweight
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Obese',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.redAccent, // Change color to redAccent for Obese
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  '>=30',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent, // Change color to redAccent for Obese
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
