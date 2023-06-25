import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/loginScreen.dart';
import 'package:vyapar_bandhu/Screens/ownerNavigationScreen.dart';
import 'package:vyapar_bandhu/Screens/workerNavigationScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _title = "Vyapar Bandhu";
  String type = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSpecificField();
  }

  Future<String> getSpecificField() async {
    var field =
        "type"; // Replace with the name of the field you want to retrieve

    var snapshot = await FirebaseFirestore.instance
        .collection('commonUser')
        .doc(FirebaseAuth.instance.currentUser?.email!)
        .get();
    var data = snapshot.data();

    if (data != null && data.containsKey(field)) {
      print("type is ${data[field]}");
      setState(() {
        type = data[field];
      });
      return data[field];
    } else {
      return 'Field not found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //on the time of opening the app , if not logged in the loginPage else accordingly
        home: (FirebaseAuth.instance.currentUser == null)
            ? LoginScreen()
            : ((type == "owner")
                ? OwnerNavigationScreen()
                : WorkerNavigationScreen()));
  }
}
/*
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}*/
/*
class _MainScreenState extends State<MainScreen> {
  final userAuth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        //builder dependent on auth state with initial state of current user
        stream: FirebaseAuth.instance.authStateChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          //if user logged in ?? then is owner/worker/not registered
          if (snapshot.hasData) {
            //do every thing inside when snapshot has data
            String userEmail = FirebaseAuth.instance.currentUser!.email!;
            String type = '';

            FirebaseFirestore.instance
                .collection('commonUser')
                .doc("userEmail")
                .get()
                .then((DocumentSnapshot snapshot) =>
                    print(type = snapshot['type'] as String));
            print((type != "owner"));

            return HomeScreen().showScreen(type == "owner");
          }
          //if user isn't logged in
          else if (!(snapshot.hasData)) {
            return const LoginScreen();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}*/

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
