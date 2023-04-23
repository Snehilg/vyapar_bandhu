import 'package:flutter/material.dart';

class WorkerNavigationScreen extends StatelessWidget {
  const WorkerNavigationScreen({Key? key}) : super(key: key);
  static const String _title = 'Worker Navigation Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
                      onPressed: null,
                      child: Text(
                        'Sell Item',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                //Mark Attendance
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
                      onPressed: null,
                      child: Text(
                        'Mark Attendance',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                //Salary
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
                      onPressed: null,
                      child: Text(
                        'Salary',
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
                      onPressed: null,
                      child: Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
