import 'package:cloud_firestore/cloud_firestore.dart';

class BMIModel {
  static const String COLLECTION_NAME = "Bmi";
  String id;
  String? status;
  double height;
  double weight;
  int age;
  DateTime time;

  BMIModel({
    this.id = '',
    this.status,
    required this.weight,
    required this.age,
    required this.height,
    required this.time,
  });

  BMIModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        status = json['status'],
        weight = json['weight'],
        age = json['age'],
        height = json['height'],
        time = (json['time'] as Timestamp).toDate();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "status": status,
      "height": height,
      "weight": weight,
      "age": age,
      "time": time,
    };
  }
}
