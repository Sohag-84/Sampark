import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/group_controller.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class GroupTitlePage extends StatelessWidget {
  GroupTitlePage({super.key});

  final groupController = Get.put(GroupController());

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
      body: Column(
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
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Gap(10),
                      const TextField(
                        decoration: InputDecoration(
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
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
          ),
        ],
      ),
    );
  }
}
