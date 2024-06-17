import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/group_controller.dart';
import 'package:sampark/controller/image_picker.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class GroupTitlePage extends StatelessWidget {
  GroupTitlePage({super.key});

  final groupController = Get.put(GroupController());
  final imageController = Get.put(ImagePickerController());
  final RxBool isEdit = false.obs;
  final RxString imagePath = "".obs;

  final groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Group"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.done,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Gap(10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ///group image
                        Obx(
                          () => InkWell(
                            onTap: () async {
                              imagePath.value = await imageController.pickImage(
                                source: ImageSource.gallery,
                              );
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: imagePath.value.isEmpty
                                  ? const Icon(Icons.group, size: 40)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(imagePath.value),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        TextField(
                          controller: groupNameController,
                          decoration: const InputDecoration(
                            hintText: "Group Name",
                            prefixIcon: Icon(Icons.group),
                          ),
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                children: groupController.groupMembers
                    .map(
                      (user) => ChatTile(
                        onTap: () {},
                        imgUrl:
                            user.profileImage ?? AssetsImage.defaultProfileUrl,
                        name: user.name ?? "",
                        lastChat: user.about ?? "",
                        lastTime: "",
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
