import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/views/screens/home_screen/home_screen.dart';
import 'package:whats_app_clone/views/screens/welcome_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'views/screens/enter_number_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      // home: EnterNumberScreen(),
      // home: HomeScreen(),
    );
  }
}
