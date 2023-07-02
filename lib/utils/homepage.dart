import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
            ),
            height: 200,
            width: 420,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'WhatsApp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.photo_camera_rounded,
                            color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search, color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        ),
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
                          icon: Icon(
                            Icons.groups_2_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          'CHATS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          'STATUS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Text(
                          'CALLS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 24,
            ),
            title: Text('Thomas'),
            subtitle: Text("Hey folks what's a better option for me"),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
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
          SizedBox(
            height: 5,
          ),
          ListTile(
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
          SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.teal.shade800,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
