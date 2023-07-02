import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/firebase/firebase_database.dart';
import 'package:whats_app_clone/theme/colors.dart';
import 'package:whats_app_clone/views/screens/profile_info_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.phoneNumber, required this.countryCode});

  final int phoneNumber;
  final int countryCode;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreen();
}

class _OtpVerificationScreen extends State<OtpVerificationScreen> {
  String verificationID = '';
  TextEditingController otpController = TextEditingController();

  sendOtp() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: "+${widget.countryCode} ${widget.phoneNumber}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        print('code sent');
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOtpAndSignIn() async {
    if (otpController.text.isNotEmpty && otpController.text.length == 6) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otpController.text,
      );
      UserCredential currentUser = await FirebaseAuth.instance.signInWithCredential(credential);

      if (currentUser.user == null) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfileInfoPage(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendOtp();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.size.height - size.padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            "Verifying your number",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal.shade800, fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          const Icon(Icons.more_vert_outlined)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Text(
                        "Waiting to automatically detect an SMS sent to +${widget.countryCode} ${widget.phoneNumber}. Wrong number?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        textAlign: TextAlign.center,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        controller: otpController,
                        decoration: const InputDecoration(
                          hintText: "- - -  - - -",
                          counterText: "",
                          hintStyle: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Enter 6-digit code',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.sms,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Resend SMS',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(width: 205),
                        const Text(
                          '1:04',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      height: 5,
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.phone_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Call me',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 237,
                        ),
                        const Text(
                          '1:04',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: MyColors.primary),
                    onPressed: () async {
                      verifyOtpAndSignIn();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const ProfileInfoPage(),
                      //   ),
                      // );
                    },
                    child: const Text('NEXT'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
