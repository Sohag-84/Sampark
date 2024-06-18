import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/models/user_model.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxList<UserModel> groupMembers = <UserModel>[].obs;
  final profileController = Get.put(ProfileController());

  final uuid = const Uuid();
  RxBool isLoading = false.obs;

  void selectMember({required UserModel user}) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }

  ///for create group
  Future<void> createGroup({
    required String groupName,
    required String imagePath,
  }) async {
    isLoading.value = true;
    String groupId = uuid.v6();
    try {
      String imgUrl =
          await profileController.uploadFileToFirebase(imagePath: imagePath);

      await db.collection("groups").doc(groupId).set({
        "id": groupId,
        "name": groupName,
        "profileUrl": imgUrl,
        "members": groupMembers.map((user) => user.toJson()).toList(),
        "createdAt": DateTime.now().toString(),
        "createdBy": auth.currentUser!.uid,
        "timeStamp": DateTime.now().toString(),
      });

      Get.snackbar("Group Created", "Group Created Successfully");
      Get.offAllNamed("/home");
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
