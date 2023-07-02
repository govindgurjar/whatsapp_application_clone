import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/num_verification1.dart';

void main() {
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wellcome to WhatsApp',
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.teal.shade800,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            height: 400,
            width: 400,
            child: Image(image: AssetImage('images/whatsapplogo1.png')),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Read our Privacy Policy. Tap "Agree and countinue" to accept the Terms of Service.',
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal.shade800,
              fixedSize: const Size(300, 45),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const NumVerificationPage()),
                ),
              );
            },
            child: Text('AGREE AND CONTINUE'),
          ),
        ],
      ),
    ));
  }
}
