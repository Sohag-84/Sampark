import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/models/chat_model.dart';
import 'package:uuid/uuid.dart';

import 'profile_controller.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  var uuid = const Uuid();

  ProfileController profileController = Get.put(ProfileController());

  ///for room id
  String getRoomId({required String targetUserId}) {
    final currentUserId = auth.currentUser!.uid;

    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  ///for send message
  Future<void> sendMessage({
    required String targetUserId,
    required String message,
  }) async {
    isLoading.value = true;
    String roomId = getRoomId(targetUserId: targetUserId);
    var chatId = uuid.v6();

    final newChat = ChatModel(
      id: chatId,
      message: message,
      senderId: auth.currentUser!.uid,
      senderName: profileController.currentUser.value.name,
      receiverId: targetUserId,
      timestamp: DateTime.now().toString(),
    );

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading.value = false;
  }

  ///get all message list
  Stream<List<ChatModel>> getMessages({required String targetUserId}) {
    String roomId = getRoomId(targetUserId: targetUserId);

    return db
        .collection('chats')
        .doc(roomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ChatModel.fromJson(doc.data()))
            .toList());
  }
}
