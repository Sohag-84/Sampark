import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/models/user_model.dart';

class AuthController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  // For Login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(
          msg: 'Wrong password provided for that user.',
        );
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    isLoading.value = false;
  }

  ///user signup
  Future<void> createUser({
    required String email,
    required String password,
    required String name,
  }) async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser(email: email, name: name);
      Fluttertoast.showToast(msg: "Account Created 🔥🔥");
      Get.offAllNamed("/home");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    isLoading.value = false;
  }

  ///user logout
  Future<void> logoutUser() async {
    await auth.signOut();
    Get.offAllNamed("/auth-page");
  }

  Future<void> initUser({
    required String email,
    required String name,
  }) async {
    var newUser = UserModel(
      email: email,
      name: name,
      id: auth.currentUser!.uid,
    );

    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(newUser.toJson());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
