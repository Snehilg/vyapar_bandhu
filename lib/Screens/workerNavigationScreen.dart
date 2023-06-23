import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/sellItemScreen.dart';

class WorkerNavigationScreen extends StatelessWidget {
  const WorkerNavigationScreen({Key? key}) : super(key: key);
  static const String _title = 'Worker Navigation Screen';

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
      ),
    );
  }
}
