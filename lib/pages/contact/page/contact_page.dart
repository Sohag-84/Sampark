import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/contact/widgets/contact_search.dart';
import 'package:sampark/pages/contact/widgets/new_contact_tile.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
            ChatTile(
              onTap: () {
                Get.toNamed("/chat");
              },
              imgUrl: AssetsImage.boyPic,
              name: "Yakub",
              lastChat: "Hi! How are you?",
              lastTime: "10:30 PM",
            ),
            ChatTile(
              onTap: () {
                Get.toNamed("/chat");
              },
              imgUrl: AssetsImage.girlPic,
              name: "Nahida",
              lastChat: "Hi! How are you?",
              lastTime: "10:30 PM",
            ),
            ChatTile(
              onTap: () {
                Get.toNamed("/chat");
              },
              imgUrl: AssetsImage.boyPic,
              name: "Sharif",
              lastChat: "Hi! How are you?",
              lastTime: "10:30 PM",
            ),
            ChatTile(
              onTap: () {
                Get.toNamed("/chat");
              },
              imgUrl: AssetsImage.boyPic,
              name: "Sharif",
              lastChat: "Hi! How are you?",
              lastTime: "10:30 PM",
            ),
            ChatTile(
              onTap: () {
                Get.toNamed("/chat");
              },
              imgUrl: AssetsImage.boyPic,
              name: "Nahid",
              lastChat: "Hi! How are you?",
              lastTime: "10:30 PM",
            ),
            ChatTile(
              onTap: () {
                Get.toNamed("/chat");
              },
              imgUrl: AssetsImage.girlPic,
              name: "Nowrin",
              lastChat: "Hi! How are you?",
              lastTime: "10:30 PM",
            )
          ],
        ),
      ),
    );
  }
}
