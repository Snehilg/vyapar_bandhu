import 'package:flutter/material.dart';

class AddWorkerScreen extends StatelessWidget {
  const AddWorkerScreen({Key? key}) : super(key: key);
  static const String _title = 'Add Worker';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            //name field
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter the name of item'),
              ),
            ),
            //age field
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                    hintText: 'Enter Age'),
              ),
            ),
            //salary field
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Salary',
                    hintText: 'Enter Salary'),
              ),
            ),
            //workers email field
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Workers Email',
                    hintText: 'Enter Workers Email'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Add Button
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: const TextButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: null,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
