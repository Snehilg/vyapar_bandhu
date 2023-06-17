import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:vyapar_bandhu/modal/persons.dart';

//users repo  will ask for person modal object and will upload that data
class UsersRepository {
  Persons persons;
  UsersRepository(@required this.persons);

  //refs for collections
  CollectionReference worker = FirebaseFirestore.instance.collection('workers');
  CollectionReference owner = FirebaseFirestore.instance.collection('owners');

  //for adding at the time of login
  Future<void> addUser() {
    //if user is owner
    if (persons.isOwner) {
      return owner //using .doc and .set we are naming doc ourself,here doc_name->email
          .doc(persons.email)
          .set({
            'address': persons.address,
            'age': persons.age,
            'name': persons.name,
            'email': persons.email,
          })
          .then((value) => print('owner added'))
          .catchError((onError) => print('Failed to add owner'));
    } //is user is worker
    else {
      return worker
          .doc(persons.email)
          .set({
            'address': persons.address,
            'age': persons.age,
            'name': persons.name,
            'email': persons.email,
          })
          .then((value) => print('worker added'))
          .catchError((onError) => print('Failed to add worker'));
    }
  }
}
