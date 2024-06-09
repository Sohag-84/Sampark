import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/chat/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(AssetsImage.boyPic),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sohag",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Online",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatMicSvg,
                width: 25,
              ),
            ),
            const Gap(10),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    filled: false, hintText: "Type message...."),
              ),
            ),
            const Gap(10),
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatGallarySvg,
                width: 25,
              ),
            ),
            const Gap(10),
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatSendSvg,
                width: 25,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: const [
            ChatBubble(
              message: "How are you?",
              isComming: false,
              time: "10:12 PM",
              status: "read",
              imageUrl: "",
            ),
            ChatBubble(
              message: "Fine.What about you?",
              isComming: true,
              time: "10:12 PM",
              status: "read",
              imageUrl: "",
            ),
            ChatBubble(
              message: "Fine.What about you?",
              isComming: false,
              time: "10:12 PM",
              status: "read",
              imageUrl:
                  "https://w7.pngwing.com/pngs/348/885/png-transparent-flutter-dev-illustration.png",
            ),
          ],
        ),
      ),
    );
  }
}
