import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/firebase/firebase_database.dart';

import 'home_screen/home_screen.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Profile info",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.teal.shade800, fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const Icon(Icons.more_vert_outlined)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  "Please provide your name and an optional profile photo",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey.shade200,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                    size: 34,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 360,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Type your name here",
                    suffixIcon: Icon(
                      Icons.emoji_emotions,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade800),
                onPressed: () {
                  // added new user name to auth
                  FirebaseAuth.instance.currentUser!.updateDisplayName(userName);

                  // add user to firestore db
                  FirebaseDatabase.addNewUserToDataBase(
                    FirebaseAuth.instance.currentUser!.uid,
                    userName,
                    "",
                  );
                  // send to next screen
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (Route<dynamic> route) => false);
                },
                child: const Text('NEXT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
