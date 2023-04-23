import 'package:flutter/material.dart';

class MarkAttendanceScreen extends StatelessWidget {
  const MarkAttendanceScreen({Key? key}) : super(key: key);
  static const String _title = ' Mark Attendance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            //secret code
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Secret Code',
                    hintText: 'Enter secret code provided by your owner'),
              ),
            ),
            //present button
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: const TextButton(
                onPressed: null,
                child: Text(
                  'Present',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
