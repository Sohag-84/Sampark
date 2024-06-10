import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:sampark/common%20widgets/primary_button.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/image_picker.dart';
import 'package:sampark/controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.put(ProfileController());
  final imageController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    RxBool isEdit = false.obs;
    RxString imagePath = "".obs;

    final nameController =
        TextEditingController(text: controller.currentUser.value.name ?? "");
    final emailController =
        TextEditingController(text: controller.currentUser.value.email ?? "");
    final phoneController = TextEditingController(
        text: controller.currentUser.value.phoneNumber ?? "");
    final aboutController =
        TextEditingController(text: controller.currentUser.value.about ?? "");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Obx(() {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isEdit.value
                                    ? InkWell(
                                        onTap: () async {
                                          imagePath.value =
                                              await imageController.pickImage(
                                            source: ImageSource.gallery,
                                          );

                                          log("image: ${imagePath.value}");
                                        },
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.surface,
                                            shape: BoxShape.circle,
                                          ),
                                          child: imagePath.value == ""
                                              ? const Icon(Icons.add, size: 35)
                                              : ClipRRect(
                                                  clipBehavior: Clip.antiAlias,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.file(
                                                    File(imagePath.value),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                        ),
                                      )
                                    : Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: theme.colorScheme.surface,
                                          shape: BoxShape.circle,
                                        ),
                                        child: imagePath.value == ""
                                            ? const Icon(Icons.image, size: 35)
                                            : ClipRRect(
                                                clipBehavior: Clip.antiAlias,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.file(
                                                  File(imagePath.value),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                              ],
                            ),
                            const Gap(20),

                            ///name
                            TextField(
                              controller: nameController,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                filled: isEdit.value,
                                label: const Text("Name"),
                                prefixIcon: const Icon(Icons.person),
                              ),
                            ),
                            const Gap(10),

                            ///about
                            TextField(
                              controller: aboutController,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                filled: isEdit.value,
                                label: const Text("About"),
                                prefixIcon: const Icon(Icons.info),
                              ),
                            ),
                            const Gap(10),

                            ///email
                            TextField(
                              controller: emailController,
                              enabled: false,
                              decoration: InputDecoration(
                                filled: isEdit.value,
                                label: const Text("Email"),
                                prefixIcon: const Icon(Icons.email),
                              ),
                            ),
                            const Gap(10),

                            ///phone
                            TextField(
                              controller: phoneController,
                              enabled: isEdit.value,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: isEdit.value,
                                label: const Text("Phone"),
                                prefixIcon: const Icon(Icons.call),
                              ),
                            ),

                            const Gap(20),
                            isEdit.value
                                ? PrimaryButton(
                                    onTap: () {
                                      isEdit.value = false;
                                    },
                                    btnName: "Save",
                                    icon: Icons.save,
                                  )
                                : PrimaryButton(
                                    onTap: () {
                                      isEdit.value = true;
                                    },
                                    btnName: "Edit",
                                    icon: Icons.edit,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
