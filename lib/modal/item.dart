import 'package:flutter/cupertino.dart';

class Item {
  //6
  final int currentQuantity;
  final int minQuantity;
  final String name;
  final String ownerUid;
  final int pricePerUnit;
  final String uid;

  const Item(
      @required this.currentQuantity,
      @required this.minQuantity,
      @required this.name,
      @required this.ownerUid,
      @required this.pricePerUnit,
      @required this.uid);

  Item.fromJson(Map<String, dynamic> json)
      : currentQuantity = json['currentQuantity'] as int,
        minQuantity = json['minQuantity'] as int,
        name = json['name'] as String,
        ownerUid = json['ownerUid'] as String,
        pricePerUnit = json['pricePerUnit'] as int,
        uid = json['uid'] as String;
}
