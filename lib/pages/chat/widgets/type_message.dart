import 'package:sampark/common%20widgets/image_picker_bottom_sheet.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/controller/image_picker.dart';
import 'package:sampark/models/user_model.dart';

class TypeMessage extends StatelessWidget {
  final UserModel userModel;
  TypeMessage({super.key, required this.userModel});

  final messageController = TextEditingController();
  final chatController = Get.put(ChatController());
  final imagePickController = Get.put(ImagePickerController());

  final RxString message = "".obs;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ///chat emoji
          SizedBox(
            width: 30,
            height: 30,
            child: SvgPicture.asset(
              AssetsImage.chatEmoji,
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
              onChanged: (value) {
                message.value = value;
              },
            ),
          ),
          const Gap(10),

          ///send image button
          Obx(
            () => chatController.selectedImagePath.value.isEmpty
                ? InkWell(
                    onTap: () {
                      imagePickerBottomSheet(
                        context: context,
                        chatController: chatController,
                        imagePickController: imagePickController,
                      );
                    },
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        AssetsImage.chatGallarySvg,
                        width: 25,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      chatController.selectedImagePath.value = "";
                    },
                    child: const Icon(Icons.close, size: 30),
                  ),
          ),
          const Gap(10),

          ///send message button
          Obx(() {
            return message.value.isEmpty &&
                    chatController.selectedImagePath.isEmpty
                ?

                ///mic icon
                SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      AssetsImage.chatMicSvg,
                      width: 25,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      if (messageController.text.trim().isNotEmpty ||
                          chatController.selectedImagePath.value.isNotEmpty) {
                        chatController.sendMessage(
                          targetUserId: userModel.id!,
                          message: messageController.text,
                          targetUser: userModel,
                        );
                        messageController.clear();
                        message.value = "";
                      }
                    },
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: chatController.isLoading.value
                          ? const CircularProgressIndicator()
                          : SvgPicture.asset(
                              AssetsImage.chatSendSvg,
                              width: 25,
                            ),
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
