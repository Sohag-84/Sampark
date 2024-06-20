import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/models/group_model.dart';
import 'package:sampark/models/user_model.dart';
import 'package:uuid/uuid.dart';

class GroupController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxList<UserModel> groupMembers = <UserModel>[].obs;
  RxList<GroupModel> groupList = <GroupModel>[].obs;
  final profileController = Get.put(ProfileController());

  final uuid = const Uuid();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getGroups();
  }

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
      groupMembers.add(
        UserModel(
          id: auth.currentUser!.uid,
          name: profileController.currentUser.value.name,
          profileImage: profileController.currentUser.value.profileImage,
          email: profileController.currentUser.value.email,
          role: "admin",
        ),
      );
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

  ///for fetched group
  Future<void> getGroups() async {
    isLoading.value = true;
    List<GroupModel> tempGroup = [];
    await db.collection('groups').get().then(
      (value) {
        tempGroup = value.docs
            .map(
              (e) => GroupModel.fromJson(e.data()),
            )
            .toList();
      },
    );
    log("temp group length: ${tempGroup.length}==***=====");
    //groupList.clear();
    groupList.value = tempGroup
        .where(
          //(e) => e.id!.contains(auth.currentUser!.uid)
          //e.id!.contains(auth.currentUser!.uid))
          (e) => e.members!.any(
            (element) => element.id == auth.currentUser!.uid,
          ),
        )
        .toList();
    log("Original group length: ${groupList.length}==***=====");
    isLoading.value = false;
  }
}
