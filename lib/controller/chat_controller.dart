import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/contact_controller.dart';
import 'package:sampark/models/audio_call_model.dart';
import 'package:sampark/models/chat_model.dart';
import 'package:sampark/models/chat_room_model.dart';
import 'package:sampark/models/user_model.dart';
import 'package:uuid/uuid.dart';

import 'profile_controller.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  var uuid = const Uuid();
  RxString selectedImagePath = "".obs;

  ProfileController profileController = Get.put(ProfileController());
  ContactController contactController = Get.put(ContactController());

  ///for room id
  String getRoomId({required String targetUserId}) {
    final currentUserId = auth.currentUser!.uid;

    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  UserModel getSender(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUser;
    } else {
      return targetUser;
    }
  }

  UserModel getReciver(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetUser;
    } else {
      return currentUser;
    }
  }

  ///for send message
  Future<void> sendMessage({
    required String targetUserId,
    required String message,
    required UserModel targetUser,
  }) async {
    isLoading.value = true;
    String roomId = getRoomId(targetUserId: targetUserId);
    var chatId = uuid.v6();
    DateTime timestamp = DateTime.now();
    String formattedTime = DateFormat("hh:mm:a").format(timestamp);

    UserModel sender =
        getSender(profileController.currentUser.value, targetUser);
    UserModel receiver =
        getReciver(profileController.currentUser.value, targetUser);

    RxString imageUrl = "".obs;
    if (selectedImagePath.value.isNotEmpty) {
      imageUrl.value = await profileController.uploadFileToFirebase(
        imagePath: selectedImagePath.value,
      );
    }

    var newChat = ChatModel(
      id: chatId,
      message: message,
      imageUrl: imageUrl.value,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserId,
      senderName: profileController.currentUser.value.name,
      timestamp: DateTime.now().toString(),
      readStatus: "unread",
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: formattedTime,
      sender: sender,
      receiver: receiver,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );

    try {
      ///for save message
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(newChat.toJson());

      ///after send message , image path will be empty
      ///so that container will remove automatically
      selectedImagePath.value = "";

      ///for save chat room details
      await db.collection("chats").doc(roomId).set(roomDetails.toJson());

      ///save contact
      await contactController.saveContact(user: targetUser);
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

  ///for get call list
  Stream<UserModel> getStatus({required String uid}) {
    return db
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((user) => UserModel.fromJson(user.data()!));
  }

  ///for get call list
  Stream<List<CallModel>> getCalls() {
    return db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('calls')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CallModel.fromJson(doc.data()))
            .toList());
  }
}
