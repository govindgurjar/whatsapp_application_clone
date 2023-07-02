import 'package:flutter/material.dart';
import 'package:whats_app_clone/views/screens/enter_number_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const EnterNumberScreen()),
                      ),
                    );
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
