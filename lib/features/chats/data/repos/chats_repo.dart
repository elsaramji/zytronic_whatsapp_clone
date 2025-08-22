import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/models/chat_model.dart';

/**
 * chats repo 
 * used to add and update chats
 * used to get all chats.
 * responsible for all chats logic in the app by firestore. 
 */
class ChatsRepo {
  // firestore instance
  final firestore = FirebaseFirestore.instance;

  // add chat to firestore.

  void addChat({required Chat chat}) async {
    try {
      // add chat logic.
      await firestore.collection('chats').add(chat.toJson());
      // debug checking add
      log('chat added');
    } catch (e) {
      // error handling
      log(e.toString());
    }
  }

  // update chat to firestore.
  void updateChat({required Chat chat}) async {
    try {
      // get chat id by name.
      QuerySnapshot<Object?> querySnapshot = await getChatDocId(chat);
      // update chat logic.
      await firestore
          .collection('chats')
          .doc(querySnapshot.docs.first.id)
          .update(chat.toJson());
      // debug chaking update
      log('chat updated');
    } catch (e) {
      // error handling
      log(e.toString());
    }
  }

  Future<QuerySnapshot<Object?>> getChatDocId(Chat chat) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('chats')
        .where('name', isEqualTo: chat.name)
        .limit(1)
        .get();
    return querySnapshot;
  }

  // get all chats as stream from firestore.
  Stream<List<Chat>> getChats() {
    try {
      // give me all chats as stream
      return firestore.collection('chats').snapshots().map(
          (event) => event.docs.map((e) => Chat.fromJson(e.data())).toList());
    } catch (e) {
      // error handling
      log(e.toString());
      // return empty list if there is an error
      return Stream.value([]);
    }
  }
}
