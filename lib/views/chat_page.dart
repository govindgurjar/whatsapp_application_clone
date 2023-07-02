import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/firebase/firebase_auth.dart';
import 'package:whats_app_clone/theme/colors.dart';

import '../firebase/firebase_database.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key,
      required this.thisUserId,
      required this.thisUserName,
      required this.currentUserID});

  final String currentUserID;
  final String thisUserId;
  final String thisUserName;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  ScrollController messageScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        automaticallyImplyLeading: false,
        elevation: 1,
        toolbarHeight: 64,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(),
                    splashRadius: 18,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 18,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.thisUserName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'last seen today at 10:54 PM',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_camera_back,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(8),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseDatabase.getMessages(
                  widget.currentUserID, widget.thisUserId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<QueryDocumentSnapshot<Object?>> listOfUser =
                      snapshot.data!.docs;

                  listOfUser.sort(
                      (a, b) => (b['createdAt']).compareTo(a['createdAt']));
                  List<QueryDocumentSnapshot<Object?>> shortedList = [
                    ...listOfUser.reversed
                  ];

                  // Timestamp messageTime = item['createdAt'];
                  return Expanded(
                    child: SingleChildScrollView(
                      controller: messageScrollController,
                      child: Column(
                        children: [
                          for (var item in shortedList)
                            MessageCard(
                              isIAmSender:
                                  item['senderID'] == widget.currentUserID
                                      ? true
                                      : false,
                              messageText: item['message'],
                              messageTime: item['createdAt'],
                            ),
                        ],
                      ),
                    ),
                  );
                }
                return const Text('No Data');
              }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: SendMessageWidget(
              messageController: messageController,
              onTapSend: () {
                // send message
                FirebaseDatabase.addNewMessage(
                  widget.currentUserID,
                  widget.thisUserId,
                  messageController.text,
                );
                messageController.clear();
                // animate to end
                Future.delayed(
                  const Duration(
                    milliseconds: 150,
                  ),
                  () {
                    messageScrollController.animateTo(
                        messageScrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 100),
                        curve: Curves.linear);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
    required this.isIAmSender,
    required this.messageText,
    required this.messageTime,
  });

  final bool isIAmSender;
  final String messageText;
  final Timestamp messageTime;

  @override
  Widget build(BuildContext context) {
    DateTime messageTimeToDate =
        DateTime.fromMicrosecondsSinceEpoch(messageTime.microsecondsSinceEpoch);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment:
            isIAmSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isIAmSender ? 12 : 0),
              topRight: Radius.circular(isIAmSender ? 0 : 12),
              bottomLeft: const Radius.circular(12),
              bottomRight: const Radius.circular(12),
            ),
            color: isIAmSender ? const Color(0xFFEBFDE0) : Colors.white,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 220),
                    child: Text(
                      messageText,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    width: 58,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "${messageTimeToDate.hour}:${messageTimeToDate.minute < 2 ? "0" + messageTimeToDate.minute.toString() : messageTimeToDate.minute}",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SendMessageWidget extends StatelessWidget {
  SendMessageWidget({
    super.key,
    required this.onTapSend,
    required this.messageController,
  });

  final Function onTapSend;
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(right: 6),
                    constraints: const BoxConstraints(),
                    splashRadius: 18,
                    onPressed: () {},
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    splashRadius: 18,
                    icon: Icon(
                      Icons.attach_file,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(right: 4),
                    constraints: const BoxConstraints(),
                    splashRadius: 18,
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 22,
          backgroundColor: MyColors.primary,
          child: IconButton(
            onPressed: () {
              onTapSend();
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
