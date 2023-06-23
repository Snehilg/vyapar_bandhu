import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/sellItemScreen.dart';
import 'package:vyapar_bandhu/Screens/workerProfile.dart';
import 'package:vyapar_bandhu/modal/persons.dart';

class WorkerNavigationScreen extends StatelessWidget {
  const WorkerNavigationScreen({Key? key}) : super(key: key);
  static const String _title = 'Worker Navigation Screen';

  //function to get data->create person->show profile
  void showProfile(var context) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('workers')
        .doc(FirebaseAuth.instance.currentUser?.email!)
        .get();
    var data = snapshot.data();
    if (data != null) {
      //persons for workerProfile
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkerProfile(Persons(
                data['address'],
                data['age'],
                data['email'],
                data['name'],
                false,
                data['ownerEmail'])),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Column(
          children: [
            //Sell Item
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => const SellItemScreen(),
                        ));
                  },
                  child: const Text(
                    'Sell Item',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            //Profile
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () {
                    showProfile(context);
                  },
                  child: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
