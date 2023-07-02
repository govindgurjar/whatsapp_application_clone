import 'package:flutter/material.dart';
import 'package:whats_app_clone/theme/colors.dart';
import 'package:whats_app_clone/views/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
        child: CircleAvatar(
          radius: 25,
          backgroundColor: MyColors.primary,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColors.primary,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'WhatsApp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: const Icon(Icons.search, color: Colors.white),
                          ),
                          IconButton(
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.groups_2_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const Text(
                          'CHATS',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        const Text(
                          'STATUS',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        const Text(
                          'CALLS',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 24,
            ),
            title: Text('Thomas'),
            subtitle: Text("Hey folks what's a better option for me"),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 24,
              child: Image(
                image: AssetImage('images/profile.png'),
              ),
              backgroundColor: Colors.black,
            ),
            title: Text('David'),
            subtitle: Text("Hey folks what's a better option for me"),
          ),
          const SizedBox(
            height: 5,
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 24,
              child: Image(
                image: AssetImage('images/whatsapplogo1.png'),
              ),
              backgroundColor: Colors.black,
            ),
            title: Text('Annie'),
            subtitle: Text("Hey folks what's a better option for me"),
          ),
          const SizedBox(
            height: 300,
          ),
        ],
      ),
    );
  }
}
