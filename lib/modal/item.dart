import 'package:flutter/cupertino.dart';

class Item {
  //6
  final String currentQuantity;
  final String minQuantity;
  final String name;
  final String ownerEmail;
  final String pricePerUnit;
  final String uid;

  const Item(
      @required this.currentQuantity,
      @required this.minQuantity,
      @required this.name,
      @required this.ownerEmail,
      @required this.pricePerUnit,
      @required this.uid);

  Item.fromJson(Map<String, dynamic> json)
      : currentQuantity = json['currentQuantity'] as String,
        minQuantity = json['minQuantity'] as String,
        name = json['name'] as String,
        ownerEmail = json['ownerEmail'] as String,
        pricePerUnit = json['pricePerUnit'] as String,
        uid = json['uid'] as String;
}
