import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/num_verification2.dart';

class NumVerificationPage extends StatefulWidget {
  const NumVerificationPage({super.key});

  @override
  State<NumVerificationPage> createState() => _NumVerificationPageState();
}

class _NumVerificationPageState extends State<NumVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Enter your phone number",
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
                  "WhatsApp will need to verify your phone number. What's my number?",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Choose a country",
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Carrier charges may apply',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(
                height: 500,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade900),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NumVerificationSecond(),
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
