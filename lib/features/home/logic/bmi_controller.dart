import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/bmi.dart';

class BMIController {

  static CollectionReference<BMIModel> getBMICollection()
  {
    return FirebaseFirestore.instance.collection(BMIModel.COLLECTION_NAME)
        .withConverter<BMIModel>(
      fromFirestore: (snapshot,_) => BMIModel.fromJson(snapshot.data()!),
      toFirestore: (task,_) => task.toJson(),
    );
  }

  static Future<void> addBMITaskToFirestore(BMIModel bmi){

    var collection = getBMICollection();
    var docRef= collection.doc();
    bmi.id= docRef.id;
    print("object+kkkkkkk");
    return docRef.set(bmi);

  }



  static Stream<QuerySnapshot<BMIModel>> getBMIsFromFirestore() {
    Query<BMIModel> collection = getBMICollection();
    collection = collection.orderBy('time').limit(10);
    return collection.snapshots();
  }

  static Future<void> deleteBMI(String id )
  {
    return getBMICollection().doc(id).delete();
  }

  static Future<void> updateBMI(String id , BMIModel task){
    return getBMICollection().doc(id).update(task.toJson());
  }



  static String getBMIStatus(double bmi) {

    print("bmi: $bmi");
    if (bmi > 0 && bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }


  }


  static BMIModel calculateBMI(double weight, double height, int age) {
    String BMIstatus = BMIController.getBMIStatus(weight / ((height * 0.01) * (height * 0.01)));
    print(BMIstatus);
    DateTime currentTime = DateTime.now();

    BMIModel status = BMIModel(
      height: height,
      weight: weight,
      age: age,
      status: BMIstatus,
      time: currentTime,
    );

    return status;
  }

}

