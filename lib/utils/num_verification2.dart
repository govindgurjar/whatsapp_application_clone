import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/profile_info.dart';

class NumVerificationSecond extends StatefulWidget {
  const NumVerificationSecond({super.key});

  @override
  State<NumVerificationSecond> createState() => _NumVerificationSecondState();
}

class _NumVerificationSecondState extends State<NumVerificationSecond> {
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
                      "Verifying your number",
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
                  "Waiting to automatically detect an SMS sent to +91 8770207963. Wrong number?",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "- - -  - - -",
                    hintStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Enter 6-digit code',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.sms,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Resend SMS',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 205,
                  ),
                  Text(
                    '1:04',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                height: 5,
                thickness: 2,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone_outlined,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Call me',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 237,
                  ),
                  Text(
                    '1:04',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
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
                      builder: (context) => ProfileInfoPage(),
                    ),
                  );
                },
                child: Text('NEXT'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
