import 'package:flutter/material.dart';
import 'package:whats_app_clone/theme/colors.dart';
import 'package:whats_app_clone/views/otp_verification_screen.dart';

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({super.key});

  @override
  State<EnterNumberScreen> createState() => _EnterNumberScreenState();
}

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  List<Map> fakeCountryCode = [
    {
      'countryName': "India",
      'countryCode': '91',
      'countryFlagUrl': 'https://em-content.zobj.net/thumbs/160/whatsapp/352/flag-india_1f1ee-1f1f3.png'
    },
    {
      'countryName': "United States",
      'countryCode': '1',
      'countryFlagUrl': 'https://em-content.zobj.net/thumbs/160/whatsapp/352/flag-united-states_1f1fa-1f1f8.png'
    },
    {
      'countryName': "United Kingdom",
      'countryCode': '44',
      'countryFlagUrl': 'https://em-content.zobj.net/thumbs/160/whatsapp/352/flag-united-kingdom_1f1ec-1f1e7.png'
    },
    {
      'countryName': "Singapore",
      'countryCode': '65',
      'countryFlagUrl': 'https://em-content.zobj.net/thumbs/160/whatsapp/352/flag-singapore_1f1f8-1f1ec.png'
    },
  ];

  int? activeCountryIndex;

  String? activeCountryCode = '0';
  String? enteredPhoneNumber = '';

  TextEditingController countryCodeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 30),
                        Text(
                          "Enter your phone number",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.teal.shade800, fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const Icon(Icons.more_vert_outlined)
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(22.0),
                      child: Text(
                        "WhatsApp will need to verify your phone number. What's my number?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                color: Colors.white,
                                child: ListView.builder(
                                  itemCount: fakeCountryCode.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          activeCountryIndex = index;
                                          activeCountryCode = fakeCountryCode[index]['countryCode'];
                                        });

                                        Navigator.pop(context);
                                      },
                                      child: CountryCodeListCard(
                                        countryCode: fakeCountryCode[index]['countryCode'],
                                        countryName: fakeCountryCode[index]['countryName'],
                                        imageUrl: fakeCountryCode[index]['countryFlagUrl'],
                                      ),
                                    );
                                  },
                                ),
                              );
                              // for latter use
                              // return Container(
                              //   height: MediaQuery.of(context).size.height,
                              //   color: Colors.white,
                              //   child: Column(
                              //     children: [
                              //       for (var i = 0; i < fakeCountryCode.length; i++)
                              // CountryCodeListCard(
                              //   countryCode: fakeCountryCode[i]['countryCode'],
                              //   countryName: fakeCountryCode[i]['countryName'],
                              //   imageUrl: fakeCountryCode[i]['countryFlagUrl'],
                              // ),
                              //     ],
                              //   ),
                              // );
                            },
                          );
                        },
                        splashColor: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  Row(
                                    children: [
                                      if (activeCountryIndex != null)
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8),
                                          child: Image.network(
                                            fakeCountryCode[activeCountryIndex!]['countryFlagUrl'],
                                            width: 24,
                                          ),
                                        ),
                                      Text(
                                        activeCountryIndex == null
                                            ? 'Choose a County'
                                            : fakeCountryCode[activeCountryIndex!]['countryName'],
                                        style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                            Divider(
                              height: 2,
                              thickness: 2,
                              color: MyColors.primary.withOpacity(0.7),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 54,
                          child: TextField(
                            textAlign: TextAlign.center,
                            maxLength: 3,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: activeCountryCode,
                              prefixStyle: const TextStyle(color: Colors.grey),
                              prefixIcon: const Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.grey,
                              ),
                              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.primary, width: 2),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.primary, width: 1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 230,
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                enteredPhoneNumber = value;
                              });
                            },
                            textAlign: TextAlign.center,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              counterText: "",
                              hintText: "Enter phone number",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.primary, width: 2),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: MyColors.primary, width: 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Carrier charges may apply',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: MyColors.primary),
                    onPressed: () {
                      if (activeCountryIndex == null) {
                        print('Add Phone Number');
                        return;
                      }

                      print({'number': enteredPhoneNumber, 'code': activeCountryCode});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen(
                            phoneNumber: int.parse('$enteredPhoneNumber'),
                            countryCode: int.parse('$activeCountryCode'),
                          ),
                        ),
                      );
                    },
                    child: const Text('NEXT'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountryCodeListCard extends StatelessWidget {
  const CountryCodeListCard({
    super.key,
    required this.imageUrl,
    required this.countryName,
    required this.countryCode,
  });

  final String imageUrl;
  final String countryName;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 28,
          leading: Image.network(
            imageUrl,
            width: 24,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          title: Text(
            countryName,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: Text(
            "+$countryCode",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}
