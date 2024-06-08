import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          onTap: () {
            Get.toNamed("/chat");
          },
          imgUrl: AssetsImage.boyPic,
          name: "Yakub",
          lastChat: "Hi! How are you?",
          lastTime: "10:30 PM",
        ),
        ChatTile(
          onTap: () {
            Get.toNamed("/chat");
          },
          imgUrl: AssetsImage.girlPic,
          name: "Nahida",
          lastChat: "Hi! How are you?",
          lastTime: "10:30 PM",
        ),
        ChatTile(
          onTap: () {
            Get.toNamed("/chat");
          },
          imgUrl: AssetsImage.boyPic,
          name: "Sharif",
          lastChat: "Hi! How are you?",
          lastTime: "10:30 PM",
        ),
        ChatTile(
          onTap: () {
            Get.toNamed("/chat");
          },
          imgUrl: AssetsImage.boyPic,
          name: "Nahid",
          lastChat: "Hi! How are you?",
          lastTime: "10:30 PM",
        ),
        ChatTile(
          onTap: () {
            Get.toNamed("/chat");
          },
          imgUrl: AssetsImage.girlPic,
          name: "Nowrin",
          lastChat: "Hi! How are you?",
          lastTime: "10:30 PM",
        ),
      ],
    );
  }
}
