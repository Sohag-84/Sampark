import 'package:intl/intl.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/models/user_model.dart';
import 'package:sampark/pages/chat/widgets/chat_bubble.dart';
import 'package:sampark/pages/user%20profile/pages/user_profile_page.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  ChatPage({super.key, required this.userModel});

  final chatController = Get.put(ChatController());
  final profileController = Get.put(ProfileController());

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.to(() => UserProfilePage(userModel: userModel));
          },
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.only(left: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                userModel.profileImage ?? AssetsImage.defaultProfileUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userModel.name ?? "",
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
            ///mic icon
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatMicSvg,
                width: 25,
              ),
            ),
            const Gap(10),

            ///textfield
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  filled: false,
                  hintText: "Type message....",
                ),
              ),
            ),
            const Gap(10),

            ///send image button
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                AssetsImage.chatGallarySvg,
                width: 25,
              ),
            ),
            const Gap(10),

            ///send message button
            InkWell(
              onTap: () {
                if (messageController.text.trim().isNotEmpty) {
                  chatController.sendMessage(
                    targetUserId: userModel.id!,
                    message: messageController.text,
                    targetUser: userModel,
                  );
                  messageController.clear();
                }
              },
              child: SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  AssetsImage.chatSendSvg,
                  width: 25,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10.0,
          right: 10,
          bottom: 70,
        ),
        child: StreamBuilder(
          stream: chatController.getMessages(
            targetUserId: userModel.id!,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.data == null) {
              return const Center(
                child: Text(
                  "No Message found",
                ),
              );
            } else {
              return ListView.builder(
                reverse: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final message = snapshot.data![index];

                  DateTime timestamp = DateTime.parse(message.timestamp!);
                  String formattedTime =
                      DateFormat("hh:mm:a").format(timestamp);

                  return ChatBubble(
                    message: message.message.toString(),
                    isComming: message.receiverId ==
                        profileController.currentUser.value.id,
                    time: formattedTime,
                    status: "read",
                    imageUrl: message.imageUrl ?? "",
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
