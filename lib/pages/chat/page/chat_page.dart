import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/call_controller.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/models/user_model.dart';
import 'package:sampark/pages/caller%20page/audio%20call%20page/audio_call_page.dart';
import 'package:sampark/pages/chat/widgets/chat_bubble.dart';
import 'package:sampark/pages/chat/widgets/type_message.dart';
import 'package:sampark/pages/user%20profile/pages/user_profile_page.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  ChatPage({super.key, required this.userModel});

  final chatController = Get.put(ChatController());
  final profileController = Get.put(ProfileController());
  final callController = Get.put(CallController());

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
              child: CachedNetworkImage(
                imageUrl:
                    userModel.profileImage ?? AssetsImage.defaultProfileUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
            StreamBuilder(
              stream: chatController.getStatus(uid: userModel.id!),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text("....");
                } else {
                  return Text(
                    snapshot.data!.status ?? "Offline",
                    style: Theme.of(context).textTheme.labelSmall,
                  );
                }
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => AudioCallPage(reciever: userModel));
              callController.callAction(
                receiver: userModel,
                caller: profileController.currentUser.value,
              );
            },
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10.0,
          right: 10,
        ),
        child: Column(
          children: [
            ///message list
            Expanded(
              child: Stack(
                children: [
                  StreamBuilder(
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

                            DateTime timestamp =
                                DateTime.parse(message.timestamp!);
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
                  Obx(
                    () => chatController.selectedImagePath.value.isNotEmpty
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Stack(
                              children: [
                                Container(
                                  height: 300,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: FileImage(
                                        File(
                                          chatController
                                              .selectedImagePath.value,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      chatController.selectedImagePath.value =
                                          "";
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
            TypeMessage(userModel: userModel)
          ],
        ),
      ),
    );
  }
}
