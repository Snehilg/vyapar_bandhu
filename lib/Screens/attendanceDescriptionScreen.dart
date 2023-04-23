import 'package:flutter/material.dart';

class AttendanceDescriptionScreen extends StatelessWidget {
  const AttendanceDescriptionScreen({Key? key}) : super(key: key);
  static const String _title = 'Attendance Description';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "thinking about logic",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
