import 'package:bmi/core/theming/colors.dart';
import 'package:bmi/features/home/logic/bmi_controller.dart';
import 'package:bmi/features/home/ui/widget/bmi_status_card.dart';
import 'package:bmi/models/bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../auth/logic/auth_controller.dart';

class BMIStatusScreen extends StatefulWidget {

  @override
  State<BMIStatusScreen> createState() => _BMIStatusScreenState();
}

class _BMIStatusScreenState extends State<BMIStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorsManager.mainBlue,actions: <Widget>[
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            await AuthController.signOut();
            Navigator.pushReplacementNamed(context, Routes.loginScreen);

          },
        ),],),

      body:  StreamBuilder(
        stream: BMIController.getBMIsFromFirestore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Column(
              children: [
                const Text("Something is wrong!"),
                ElevatedButton(onPressed: () {}, child: const Text("Try Again")),
              ],
            );
          }

          List<BMIModel> status =  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

          return ListView.builder(
            itemBuilder: (context, index) => BMICard(status[index]),
            itemCount: status.length,
          );
        },
      ),
    );

  }
}
