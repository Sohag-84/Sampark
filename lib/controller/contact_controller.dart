import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/models/chat_room_model.dart';
import 'package:sampark/models/user_model.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserList();
    await getChatRoomList();
  }

  ///for get user list
  Future<void> getUserList() async {
    isLoading.value = true;
    try {
      userList.clear();
      await db.collection("users").get().then(
            (value) => {
              userList.value = value.docs
                  .map(
                    (e) => UserModel.fromJson(e.data()),
                  )
                  .toList(),
            },
          );
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading.value = false;
  }

  Future<void> getChatRoomList() async {
    List<ChatRoomModel> tempChatRoomList = [];

    ///for get all chat list
    await db
        .collection('chats')

        //show last in first
        .orderBy('timestamp', descending: true)
        .get()
        .then((value) {
      tempChatRoomList =
          value.docs.map((e) => ChatRoomModel.fromJson(e.data())).toList();
    });

    ///for get my chat room list
    chatRoomList.value = tempChatRoomList
        .where((e) => e.id!.contains(auth.currentUser!.uid))
        .toList();
  }
}
