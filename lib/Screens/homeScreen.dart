import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/ownerNavigationScreen.dart';
import 'package:vyapar_bandhu/Screens/workerNavigationScreen.dart';

class HomeScreen {
  Scaffold showScreen(bool owner) {
    return Scaffold(
      body: owner ? OwnerNavigationScreen() : WorkerNavigationScreen(),
    );
  }
}
