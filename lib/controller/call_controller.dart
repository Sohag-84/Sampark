import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/models/audio_call_model.dart';
import 'package:sampark/models/user_model.dart';
import 'package:uuid/uuid.dart';

class CallController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final String uuid = const Uuid().v4();

  @override
  void onInit() {
    super.onInit();
    getCallsNotification().listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        Get.snackbar("Calling", "Calling your device");
      }
    });
  }

  Future<void> callAction({
    required UserModel receiver,
    required UserModel caller,
  }) async {
    var newCall = CallModel(
      id: uuid,
      callerName: caller.name,
      callerEmail: caller.email,
      callerPic: caller.profileImage,
      callerUid: caller.id,
      receiverName: receiver.name,
      receiverEmail: receiver.email,
      receiverPic: receiver.profileImage,
      receiverUid: receiver.id,
      status: "dialing",
    );

    try {
      //save call info in notification database
      //to show notification
      await db
          .collection('notification')
          .doc(receiver.id)
          .collection('call')
          .doc(uuid)
          .set(newCall.toJson());

      ///save call inof in caller user database
      ///to show call list
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('calls')
          .doc(uuid)
          .set(newCall.toJson());

      ///save call inof in reciever user database
      ///to show call list
      await db
          .collection('users')
          .doc(receiver.id)
          .collection('calls')
          .doc(uuid)
          .set(newCall.toJson());

      ///after 15 seconds call will be delete automatically
      await Future.delayed(const Duration(seconds: 15), () {
        endCall(callModel: newCall);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///get call notification
  Stream<QuerySnapshot> getCallsNotification() {
    return db
        .collection('notification')
        .doc(auth.currentUser!.uid)
        .collection('call')
        .snapshots();
  }

  ///for end call
  Future<void> endCall({required CallModel callModel}) async {
    try {
      await db
          .collection('notification')
          .doc(callModel.receiverUid)
          .collection('call')
          .doc(callModel.id)
          .delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
