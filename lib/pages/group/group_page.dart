import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/group_controller.dart';
import 'package:sampark/pages/group%20chat/page/group_chat_page.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class GroupPage extends StatelessWidget {
  GroupPage({super.key});

  final groupController = Get.put(GroupController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        children: groupController.groupList
            .map(
              (group) => ChatTile(
                onTap: () {
                  Get.to(
                    () => GroupChatPage(groupModel: group),
                    transition: Transition.rightToLeft,
                  );
                },
                imgUrl: group.profileUrl == ""
                    ? AssetsImage.defaultProfileUrl
                    : group.profileUrl!,
                name: group.name ?? "",
                lastChat: group.description ?? "",
                lastTime: "",
              ),
            )
            .toList(),
      ),
    );
  }
}
