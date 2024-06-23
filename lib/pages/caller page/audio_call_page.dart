import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/models/user_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class AudioCallPage extends StatelessWidget {
  final UserModel reciever;
  AudioCallPage({super.key, required this.reciever});
  final profileController = Get.put(ProfileController());
  final chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    var callId = chatController.getRoomId(targetUserId: reciever.id!);
    return ZegoUIKitPrebuiltCall(
      appID: ZegoCloudConfig.appId,
      appSign: ZegoCloudConfig.appSign,
      callID: callId,
      userID: profileController.currentUser.value.id ?? "root",
      userName: profileController.currentUser.value.name ?? "root",
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
    );
  }
}
