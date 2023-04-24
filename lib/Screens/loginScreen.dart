import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String _title = 'Login Screen';

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
            //email field
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            //password field
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Login Button
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: const TextButton(
                onPressed: null,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //forgot password
            const TextButton(
              onPressed: null,
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            //new user
            const TextButton(
              onPressed: null,
              child: Text(
                'New User? Create Account',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
