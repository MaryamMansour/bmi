// bmi_calculation_page.dart

import 'package:bmi/core/theming/colors.dart';
import 'package:bmi/features/auth/logic/auth_controller.dart';
import 'package:bmi/features/home/logic/bmi_controller.dart';
import 'package:bmi/models/bmi.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class BMICalculationPage extends StatefulWidget {
  @override
  _BMICalculationPageState createState() => _BMICalculationPageState();
}

class _BMICalculationPageState extends State<BMICalculationPage> {
  SnackBar snackBar = const SnackBar(
    content: Text('BMI Calculated Successfully!'),
  );
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculation'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthController.signOut();
              Navigator.pushReplacementNamed(context, Routes.loginScreen);
            },
          ),],

        backgroundColor: ColorsManager.mainBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Weight (kg)'),
          ),
          TextField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Height (m)'),
          ),
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Age'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: (){
              double weight = double.tryParse(_weightController.text) ?? 0;
              double height = double.tryParse(_heightController.text) ?? 0;
              int age = int.tryParse(_ageController.text) ?? 0;
              BMIModel status = BMIController.calculateBMI(weight, height, age);
              BMIController.addBMITaskToFirestore(status);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Calculate BMI'),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.homeScreen);
            },
            child: const Text("See Result"),
          )
        ],
      ),
    );
  }


}
