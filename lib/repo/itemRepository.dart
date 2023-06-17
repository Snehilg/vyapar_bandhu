import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/modal/item.dart';

class ItemRepository {
  Item item;
  ItemRepository(@required this.item);

  //refs for collections
  CollectionReference owners = FirebaseFirestore.instance.collection('owners');

  Future<void> addItem() {
    //going inside owners->ownerDoc->items
    CollectionReference items = owners.doc(item.ownerEmail).collection('items');

    return items
        .doc(item.uid)
        .set({
          'currentQuantity': item.currentQuantity,
          'minQuantity': item.minQuantity,
          'name': item.name,
          'ownerEmail': item.ownerEmail,
          'pricePerUnit': item.pricePerUnit,
          'uid': item.uid,
        })
        .then((value) => print('item added'))
        .catchError((onError) => print('failed to add item'));
  }
}
