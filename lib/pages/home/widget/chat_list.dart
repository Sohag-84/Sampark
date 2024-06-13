import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/controller/contact_controller.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/pages/chat/page/chat_page.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class ChatList extends StatelessWidget {
  ChatList({super.key});

  final controller = Get.put(ContactController());
  final contactController = Get.put(ContactController());
  final profileController = Get.put(ProfileController());
  final chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return controller.getChatRoomList();
      },
      child: Obx(() {
        return ListView(
          children: controller.chatRoomList
              .map(
                (e) => ChatTile(
                  onTap: () {
                    Get.to(
                      () => ChatPage(
                        userModel: (e.receiver!.id ==
                                profileController.currentUser.value.id
                            ? e.sender
                            : e.receiver)!,
                      ),
                    );
                  },
                  imgUrl:
                      (e.receiver!.id == profileController.currentUser.value.id
                              ? e.sender!.profileImage
                              : e.receiver!.profileImage) ??
                          AssetsImage.defaultProfileUrl,
                  name:
                      (e.receiver!.id == profileController.currentUser.value.id
                              ? e.sender!.name
                              : e.receiver!.name) ??
                          "",
                  lastChat: e.lastMessage ?? "",
                  lastTime: e.lastMessageTimestamp ?? "",
                ),
              )
              .toList(),
        );
      }),
    );
  }
}
