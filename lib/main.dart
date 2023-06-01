import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/attendanceDescriptionScreen.dart';
import 'package:vyapar_bandhu/Screens/employeeManagementScreen.dart';
import 'package:vyapar_bandhu/Screens/loginScreen.dart';
import 'package:vyapar_bandhu/Screens/markAttendanceScreen.dart';
import 'package:vyapar_bandhu/Screens/ownerInventoryScreen.dart';
import 'package:vyapar_bandhu/Screens/ownerNavigationScreen.dart';
import 'package:vyapar_bandhu/Screens/profileScreen.dart';
import 'package:vyapar_bandhu/Screens/salaryScreen.dart';
import 'package:vyapar_bandhu/Screens/sellItemScreen.dart';
import 'package:vyapar_bandhu/Screens/workerNavigationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = "Vyapar Bandhu";

  //myApp <- optionScreen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.blue,
        ),
        body: const SafeArea(
          child: OptionScreen(),
        ),
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(""),
    );
  }
}

/*
return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Login Screen
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text(
                "Login Screen",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Owner Navigation Screen
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OwnerNavigationScreen()),
                );
              },
              child: const Text(
                "Owner Nav Screen",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //worker Navigation screen
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WorkerNavigationScreen()),
                );
              },
              child: const Text(
                "Worker Nav Screen",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Owner Inventory
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OwnerInventoryScreen()),
                );
              },
              child: const Text(
                "Owner Inventory",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Profile
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
              child: const Text(
                "Profile",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Attendance Description
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AttendanceDescriptionScreen()),
                );
              },
              child: const Text(
                "Attendance Description",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Employee Management
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmployeeManagementScreen()),
                );
              },
              child: const Text(
                "Employee Management",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //sell item
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SellItemScreen()),
                );
              },
              child: const Text(
                "Sell Item",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Mark attendance
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MarkAttendanceScreen()),
                );
              },
              child: const Text(
                "Mark Attendance",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Salary
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalaryScreen()),
                );
              },
              child: const Text(
                "Salary",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
*/
