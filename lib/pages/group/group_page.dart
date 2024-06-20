import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/group_controller.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class GroupPage extends StatefulWidget {
  GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final groupController = Get.put(GroupController());
  @override
  void initState() {
    super.initState();
    groupController.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("List length: ${groupController.groupList.length}=====");
    return Obx(
      () => ListView(
              children: groupController.groupList
                  .map(
                    (group) => ChatTile(
                      onTap: () {},
                      imgUrl: group.profileUrl ?? AssetsImage.defaultProfileUrl,
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
