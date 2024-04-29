import 'package:bmi/features/home/logic/bmi_controller.dart';
import 'package:flutter/material.dart';
import 'package:bmi/models/bmi.dart';

import '../screens/calculate_sceen.dart';

class BMICard extends StatefulWidget {
  final BMIModel status;

  BMICard(this.status);

  @override
  _BMICardState createState() => _BMICardState();
}

class _BMICardState extends State<BMICard> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _heightController.text = widget.status.height.toString();
    _weightController.text = widget.status.weight.toString();
    _ageController.text = widget.status.age.toString();
    _statusController.text = widget.status.status!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Height: ${widget.status.height} m',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        BMIController.deleteBMI(widget.status.id);
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Weight: ${widget.status.weight} kg',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Age: ${widget.status.age}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Status: ${widget.status.status}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit BMI Entry'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Height (m)'),
                ),
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Weight (kg)'),
                ),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Age'),
                ),

              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                double weight = double.tryParse(_weightController.text) ?? 0;
                double height = double.tryParse(_heightController.text) ?? 0;
                int age = int.tryParse(_ageController.text) ?? 0;

                BMIModel updatesBMIstatus = BMIController.calculateBMI(weight, height, age);

                BMIController.updateBMI(widget.status.id, updatesBMIstatus);

                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
