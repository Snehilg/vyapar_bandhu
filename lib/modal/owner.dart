import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:vyapar_bandhu/modal/item.dart';

class Owner {
  //5
  final String address;
  final int age;
  final String email;
  //final Item item[];
  final String name;
  final String uid;
  //final Worker worker[];

  const Owner(
    @required this.address,
    @required this.age,
    @required this.email,
    /*@required this.item,*/
    @required this.name,
    @required this.uid,
    /*@required this.worker*/
  );

  Owner.fromJson(Map<String, dynamic> json)
      : address = json['address'] as String,
        age = json['age'] as int,
        email = json['email'] as String,
        //doubt in as *type*  and casting
        //item=json['item'] as dynamic,
        name = json['name'] as String,
        uid = json['uid'] as String;
  //doubt in as *type* and casting
  //worker=json['worker'] as dynamic;
}
