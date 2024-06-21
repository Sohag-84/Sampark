import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/auth_controller.dart';
import 'package:sampark/controller/image_picker.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/models/group_model.dart';
import 'package:sampark/pages/group%20info/widgets/group_info_container.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class GroupInfoPage extends StatelessWidget {
  final GroupModel groupModel;
  GroupInfoPage({super.key, required this.groupModel});
  final controller = Get.put(ProfileController());
  final imageController = Get.put(ImagePickerController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(groupModel.name ?? ""),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            GroupInfoContainer(
              profileImage: groupModel.profileUrl!.isEmpty
                  ? AssetsImage.defaultProfileUrl
                  : groupModel.profileUrl!,
              userName: groupModel.name ?? "",
              userEmail: groupModel.description ?? "No description available",
            ),
            const Gap(20),
            Text("Members", style: theme.textTheme.labelMedium),
            const Gap(10),
            Column(
              children: groupModel.members!
                  .map(
                    (member) => ChatTile(
                      onTap: () {},
                      imgUrl:
                          member.profileImage ?? AssetsImage.defaultProfileUrl,
                      name: member.name ?? "",
                      lastChat: member.email ?? "",
                      lastTime: member.role == "admin" ? "Admin" : "Member",
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
