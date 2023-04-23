import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/addItemScreen.dart';
import 'package:vyapar_bandhu/Screens/addWorkerScreen.dart';

class EmployeeManagementScreen extends StatelessWidget {
  const EmployeeManagementScreen({Key? key}) : super(key: key);
  static const String _title = 'Employee Management';

  static const names = [
    'Jitendra Kumar',
    'Jitendra Kumar',
    'Jitendra Kumar',
    'Jitendra Kumar',
    'Jitendra Kumar',
    'Jitendra Kumar',
    'Jitendra Kumar',
    'Jitendra Kumar',
    'Jitendra Kumar',
  ];

  static const age = [40, 70, 60, 80, 90, 60, 21, 40, 50];
  static const leaves_taken = [2, 4, 6, 7, 5, 8, 5, 14, 2];
  static const days_worked = [22, 3, 0, 12, 14, 20, 27, 10, 11];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue),
      body: SafeArea(
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  //we have used flex in the column and icon as well to allot 3:1 space
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name of worker
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Text(
                              names[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          //age of worker
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'age :${age[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          //leaves taken
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'leaves taken ${leaves_taken[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          //days worked
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Text(
                              'days worked ${days_worked[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      //floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddWorkerScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
