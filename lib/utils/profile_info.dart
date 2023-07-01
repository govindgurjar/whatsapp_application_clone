import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/homepage.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Profile info",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Icon(Icons.more_vert_outlined)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  "Please provide your name and an optional profile photo",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey.shade200,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                    size: 34,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 360,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type your name here",
                    suffixIcon: Icon(
                      Icons.emoji_emotions,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 450,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Text('NEXT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
