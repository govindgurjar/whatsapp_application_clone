import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/firebase/firebase_database.dart';
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
              print(FirebaseAuth.instance.currentUser!.displayName);

              // FirebaseDatabase.addNewUserToDataBase(
              //   "1C5R174D1SVvrSyV49WULgP3MC82",
              //   "Deepak",
              //   "",
              // );
              // FirebaseDatabase.addNewMessage(
              //   FirebaseAuth.instance.currentUser!.uid,
              //   FirebaseAuth.instance.currentUser!.uid,
              //   "This message to Me",
              // );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ChatPage(),
              //   ),
              // );
            },
            icon: const Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseDatabase.getUsersList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // list of users
              List<QueryDocumentSnapshot<Object?>> listOfUser = snapshot.data!.docs;
              return Container(
                child: ListView.builder(
                  itemCount: listOfUser.length,
                  padding: const EdgeInsets.only(top: 8),
                  itemBuilder: (context, index) {
                    // current user info in loop
                    var currentUserData = listOfUser[index].data() as Map;

                    if (currentUserData['userID'] == FirebaseAuth.instance.currentUser!.uid) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ChatPage(
                                currentUserID: currentUserData['userID'],
                                thisUserId: currentUserData['userID'],
                                thisUserName: "You",
                              ),
                            ),
                          );
                        },
                        child: const ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                          ),
                          title: Text("You"),
                          subtitle: Text("Hey folks what's a better option for me"),
                        ),
                      );
                    }

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ChatPage(
                              currentUserID: FirebaseAuth.instance.currentUser!.uid,
                              thisUserId: currentUserData['userID'],
                              thisUserName: currentUserData['userName'],
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 24,
                        ),
                        title: Text(currentUserData['userName']),
                        subtitle: const Text("Hey folks what's a better option for me"),
                      ),
                    );
                  },
                ),
              );
            }

            return const Text('No Data');
          }),
    );
  }
}
