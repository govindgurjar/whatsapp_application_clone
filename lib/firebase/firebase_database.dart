import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

const String usersCollection = 'users-collection';
const String messageCollection = 'message-collection';

class FirebaseDatabase {
  static addNewUserToDataBase(String userID, String userName, String userProfileUrl) {
    final _scoreDataBaseRef = FirebaseFirestore.instance.collection(usersCollection);

    final data = {
      "userID": userID,
      "userName": userName,
      "userProfileUrl": userProfileUrl,
      "createdAt": DateTime.now(), // this will be saved in TimeStamp Formate
    };

    _scoreDataBaseRef.add(data).whenComplete(
          () => log('addNewUserToDataBase Call: added User '),
        );
  }

  static addNewMessage(String senderID, String receiverID, String message) {
    final _scoreDataBaseRef = FirebaseFirestore.instance.collection(messageCollection);

    final data = {
      "senderID": senderID,
      "receiverID": receiverID,
      "senderID+receiverID": senderID + receiverID,
      "message": message,
      "createdAt": DateTime.now(), // this will be saved in TimeStamp Formate
      "createdAtTimeStamp": Timestamp.now(), // this will be saved in TimeStamp Formate
    };

    _scoreDataBaseRef.add(data).whenComplete(
          () => log('addNewMessage Call: Message added'),
        );
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUsersList() {
    return FirebaseFirestore.instance.collection(usersCollection).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(String currentUserId, String nextUserId) {
    return FirebaseFirestore.instance.collection(messageCollection).where(
      "senderID+receiverID",
      whereIn: [currentUserId + nextUserId, nextUserId + currentUserId],
    ).snapshots();
  }
}
