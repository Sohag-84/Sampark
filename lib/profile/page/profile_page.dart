import 'package:sampark/common%20widgets/primary_button.dart';
import 'package:sampark/config/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    RxBool isEdit = false.obs;

    final nameController = TextEditingController(text: "Sohag");
    final emailController = TextEditingController(text: "sohag@gmail.com");
    final phoneController = TextEditingController(text: "01316255373");
    final aboutController =
        TextEditingController(text: "Allah is enough for me");

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
                                CircleAvatar(
                                  backgroundColor: theme.colorScheme.surface,
                                  radius: 80,
                                  child: const Icon(Icons.image),
                                )
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
