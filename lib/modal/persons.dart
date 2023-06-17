import 'package:flutter/material.dart';

class Persons {
  final String address;
  final String age;
  final String email;
  final String name;
  final bool isOwner;

  Persons(@required this.address, @required this.age, @required this.email,
      @required this.name, @required this.isOwner);
}
