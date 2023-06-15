import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//enum for userType
enum UserType { owner, worker }

class _LoginScreenState extends State<LoginScreen> {
  //static const String _title = 'Login With Google';

  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String email = "";

  //value for radio button
  UserType userType = UserType.owner;

  void signIn() async {
    UserCredential user = await signInWithGoogle();
    email = user.user?.email as String;

    String address = addressController.text;
    String age = ageController.text;
    String name = nameController.text;
    String type = userType.name;

    addressController.text = '';
    ageController.text = '';
    nameController.text = '';

    print(address);
    print(age);
    print(name);
    print(email);
    print(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //title
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Register With Google",
                  style: TextStyle(color: Colors.blue, fontSize: 22),
                ),
              ),
              //name
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Full Name',
                  ),
                ),
              ),
              //address
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    hintText: 'Enter Address',
                  ),
                ),
              ),
              //age
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Age',
                    hintText: 'Enter Age',
                  ),
                ),
              ),
              //Radio Button for owner and worker
              Row(
                //radio button connects itself with an enum
                //and on changed is responsible for changing the global variable
                //group value is that global value holding the current selected option
                children: [
                  //owner
                  Row(
                    children: [
                      Radio(
                        //title: const Text('Owner'),
                        value: UserType.owner,
                        groupValue: userType,
                        onChanged: (UserType? value) {
                          setState(() {
                            userType = value!;
                          });
                        },
                      ),
                      const Text('Owner'),
                    ],
                  ),
                  //worker
                  Row(
                    children: [
                      Radio(
                        //title: const Text('Worker'),
                        value: UserType.worker,
                        groupValue: userType,
                        onChanged: (UserType? value) {
                          setState(() {
                            userType = value!;
                          });
                        },
                      ),
                      const Text('Worker'),
                    ],
                  ),
                ],
              ),
              //button for login,with container decoration
              Container(
                height: 50,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: signIn,
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //google sign in function outside build
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    //only return after logging in, flow->auth->credential creation
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
