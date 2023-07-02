import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/views/screens/enter_number_screen.dart';

import 'home_screen/home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String verificationIdD = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Welcome to WhatsApp',
              style: TextStyle(fontSize: 36, color: Colors.teal.shade800, fontWeight: FontWeight.w500),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              height: 400,
              width: 400,
              child: const Image(image: AssetImage('images/whatsapplogo1.png')),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade800,
                    fixedSize: const Size(300, 45),
                  ),
                  onPressed: () async {
                    // if user is already signed in then send to home screen
                    if (FirebaseAuth.instance.currentUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const HomeScreen()),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const EnterNumberScreen()),
                      ),
                    );

                    // ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber('+44 7123 123 456');
                    // confirmationResult.confirm("");
                  },
                  child: const Text('AGREE AND CONTINUE'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
