import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/modal/item.dart';

class ItemRepository {
  //refs for collections
  CollectionReference owners = FirebaseFirestore.instance.collection('owners');

  Future<void> addItem(Item item) {
    print('addItem invoked');
    //going inside owners->ownerDoc->items
    CollectionReference items = owners.doc(item.ownerEmail).collection('items');

    return items
        .doc(item.uid)
        .set({
          'currentQuantity': item.currentQuantity,
          'minQuantity': item.minQuantity,
          'name': item.name,
          'ownerEmail': item.ownerEmail,
          'pricePerUnit': item.price,
          'uid': item.uid,
        })
        .then((value) => print('item added'))
        .catchError((onError) => print('failed to add item'));
  }

  CollectionReference getItemRef(String workerEmail) {
    String email = "";

    FirebaseFirestore.instance
        .collection('workers')
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .get()
        .then((data) {
      email = data['ownerEmail'];
      print("inside then of item repo $email");
    }).catchError(
            (onError) => print("error in getting ownerEmail inside itemRepo "));

    print("inside itemRepo $email");

    return FirebaseFirestore.instance
        .collection('owners')
        .doc(email)
        .collection('items');
  }
}
