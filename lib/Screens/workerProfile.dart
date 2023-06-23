import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/modal/persons.dart';

class WorkerProfile extends StatelessWidget {
  //WorkerProfile({Key? key}) : super(key: key);
  final String _title = "Worker Profile";
  final Persons person;
  WorkerProfile(@required this.person);
  //doc snapshot for Worker
  var workerDoc = FirebaseFirestore.instance
      .collection('workers')
      .doc(FirebaseAuth.instance.currentUser?.email)
      .get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            //display name
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    person.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            //display email
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    person.email,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            //display age
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Age",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    person.age,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            //display position
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Position",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Worker",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            //display OwnerEmail
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Owner Email",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    person.ownerEmail,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
