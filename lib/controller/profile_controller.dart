import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/models/user_model.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

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
}
