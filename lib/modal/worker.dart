import 'package:flutter/cupertino.dart';

class Worker {
  //9
  final String address;
  final int age;
  final int daysWorked;
  final String email;
  final int leavesTaken;
  final String name;
  final String ownerUid;
  final String uid;
  final int wagePerDay;

  const Worker(
      @required this.address,
      @required this.age,
      @required this.daysWorked,
      @required this.email,
      @required this.leavesTaken,
      @required this.name,
      @required this.ownerUid,
      @required this.uid,
      @required this.wagePerDay);

  Worker.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String,
        age = json['age'] as int,
        daysWorked = json['daysWorked'] as int,
        email = json['email'] as String,
        leavesTaken = json['leavesTaken'] as int,
        name = json['name'] as String,
        ownerUid = json['ownerUid'] as String,
        uid = json['uid'] as String,
        wagePerDay = json['wagePerDay'] as int;
}
