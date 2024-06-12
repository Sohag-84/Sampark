import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/controller/contact_controller.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/pages/chat/page/chat_page.dart';
import 'package:sampark/pages/contact/widgets/contact_search.dart';
import 'package:sampark/pages/contact/widgets/new_contact_tile.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final controller = Get.put(ContactController());
  final chatController = Get.put(ChatController());
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Contact"),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: isSearchEnable.value
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ///search bar
            Obx(
              () => isSearchEnable.value
                  ? const ContactSearch()
                  : const SizedBox(),
            ),
            const Gap(10),
            NewContactTile(
              onTap: () {},
              icon: Icons.person_add,
              btnName: "New Contact",
            ),
            const Gap(10),
            NewContactTile(
              onTap: () {},
              icon: Icons.group_add,
              btnName: "New Group",
            ),
            const Gap(10),
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Contacts on Sampark"),
            ),
            const Gap(10),
            Obx(
              () => Column(
                children: controller.userList
                    .map(
                      (e) => ChatTile(
                        onTap: () {
                          Get.to(() => ChatPage(userModel: e));
                        },
                        imgUrl: e.profileImage ?? AssetsImage.defaultProfileUrl,
                        name: e.name ?? "",
                        lastChat: e.about ?? "",
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
