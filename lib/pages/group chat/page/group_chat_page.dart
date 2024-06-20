import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/controller/group_controller.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/models/group_model.dart';
import 'package:sampark/pages/chat/widgets/chat_bubble.dart';
import 'package:sampark/pages/group%20chat/widgets/group_type_message.dart';

class GroupChatPage extends StatelessWidget {
  final GroupModel groupModel;
  GroupChatPage({super.key, required this.groupModel});

  final chatController = Get.put(ChatController());
  final profileController = Get.put(ProfileController());
  final groupController = Get.put(GroupController());

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.only(left: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: CachedNetworkImage(
                imageUrl: groupModel.profileUrl == ""
                    ? AssetsImage.defaultProfileUrl
                    : groupModel.profileUrl!,
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
              groupModel.name ?? "",
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
                    stream: groupController.getGroupMessages(
                      groupId: groupModel.id!,
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
                              isComming: message.senderId !=
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
            GroupTypeMessage(groupModel: groupModel)
          ],
        ),
      ),
    );
  }
}
