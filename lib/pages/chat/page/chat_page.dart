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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
          ],
        ),
      ),
    );
  }
}
