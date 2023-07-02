import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/theme/colors.dart';

import '../../../chat_page.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({Key? key}) : super(key: key);

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
      body: Container(
        child: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.only(top: 8),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const ChatPage(),
                  ),
                );
              },
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 24,
                ),
                title: Text('Thomas'),
                subtitle: Text("Hey folks what's a better option for me"),
              ),
            );
          },
        ),
      ),
    );
  }
}
