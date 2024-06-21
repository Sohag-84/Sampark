import 'package:sampark/common%20widgets/image_picker_bottom_sheet.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/group_controller.dart';
import 'package:sampark/controller/image_picker.dart';
import 'package:sampark/models/group_model.dart';

class GroupTypeMessage extends StatelessWidget {
  final GroupModel groupModel;
  GroupTypeMessage({super.key, required this.groupModel});

  final messageController = TextEditingController();
  final groupController = Get.put(GroupController());
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
            () => groupController.selectedImagePath.value.isEmpty
                ? InkWell(
                    onTap: () {
                      imagePickerBottomSheet(
                        context: context,
                        imagePath: groupController.selectedImagePath,
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
                      groupController.selectedImagePath.value = "";
                    },
                    child: const Icon(Icons.close, size: 30),
                  ),
          ),
          const Gap(10),

          ///send message button
          Obx(() {
            return message.value.isEmpty &&
                    groupController.selectedImagePath.isEmpty
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
                          groupController.selectedImagePath.value.isNotEmpty) {
                        groupController.sendGroupMessage(
                          message: messageController.text,
                          groupId: groupModel.id!,
                          imagePath: "",
                        );
                        messageController.clear();
                        message.value = "";
                      }
                    },
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: groupController.isLoading.value
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
