import 'package:flutter/material.dart';
import 'package:whats_app_clone/theme/colors.dart';
import 'package:whats_app_clone/views/screens/home_screen/tabs/chat_tab.dart';
import 'package:whats_app_clone/views/screens/home_screen/tabs/call_tab.dart';
import 'package:whats_app_clone/views/screens/home_screen/tabs/status_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: MyColors.primary,
            toolbarHeight: 64,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Icon(Icons.camera_alt_rounded),
                Tab(
                  child: Text('CHATS', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Tab(
                  child: Text('STATUS', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
                Tab(
                  child: Text('CALL', style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            titleSpacing: 12,
            title: Row(
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
                      splashRadius: 18,
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                    IconButton(
                      splashRadius: 18,
                      padding: EdgeInsets.zero,
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
          body: const TabBarView(
            children: [
              Icon(Icons.camera),
              ChatTab(),
              StatusTab(),
              CallTab(),
            ],
          ),
        ),
      ),
    );
  }
}
