import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/models/user_model.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  RxBool isLoading = false.obs;

  Rx<UserModel> currentUser = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }

  ///for get user details
  Future<void> getUserDetails() async {
    await db.collection("users").doc(auth.currentUser!.uid).get().then((value) {
      currentUser.value = UserModel.fromJson(value.data()!);
    });
  }

  ///for update user info
  Future<void> updateProfile({
    required String imageUrl,
    required String name,
    required String about,
    required String number,
  }) async {
    isLoading.value = true;
    try {
      final imageLink = await uploadFileToFirebase(imagePath: imageUrl);
      final updatedUser = UserModel(
        id: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        name: name,
        about: about,
        profileImage:
            imageUrl == "" ? currentUser.value.profileImage : imageLink,
        phoneNumber: number,
      );
      await db.collection("users").doc(auth.currentUser!.uid).set(
            updatedUser.toJson(),
          );
      await getUserDetails();
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading.value = false;
  }

  Future<String> uploadFileToFirebase({required String imagePath}) async {
    final path = "files/$imagePath";
    final file = File(imagePath);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();
        debugPrint(downloadImageUrl);
        return downloadImageUrl;
      } catch (e) {
        debugPrint(e.toString());
        return "";
      }
    }
    return "";
  }
}
