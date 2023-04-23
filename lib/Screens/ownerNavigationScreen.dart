import 'package:flutter/material.dart';

class OwnerNavigationScreen extends StatelessWidget {
  const OwnerNavigationScreen({Key? key}) : super(key: key);
  static const String _title = 'Owner Navigation Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                //Inventory
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
                        'Inventory',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                //Monitor Attendance
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
                        'Monitor Attendance',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                //Employee Management
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
                        'Employee Management',
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
