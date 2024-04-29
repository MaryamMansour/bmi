import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/auth_controller.dart';
import '../widgets/bmi_info.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.mainBlue,
        elevation: 0.0,
        title: Text(
          'Sign in to Bre Crew',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            SizedBox(height: 20.0),
            BmiInfo(),
            SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    'Enter your name to continue as a guest:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: ColorsManager.mainBlue,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              ),
              onPressed: () async {
                await AuthController.signInAnon();
                Navigator.pushNamed(context, Routes.calculationScreen);

              },
              child: Text(
                'Sign in as Guest',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
