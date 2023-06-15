import 'package:flutter/cupertino.dart';

class Worker {
  //9
  final String address;
  final int age;
  final String email;
  final String name;
  final String ownerEmail;

  const Worker(@required this.address, @required this.age, @required this.email,
      @required this.name, @required this.ownerEmail);

  Worker.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String,
        age = json['age'] as int,
        email = json['email'] as String,
        name = json['name'] as String,
        ownerEmail = json['ownerEmail'] as String;
}
