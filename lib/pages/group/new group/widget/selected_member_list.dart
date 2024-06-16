import 'package:cached_network_image/cached_network_image.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/group_controller.dart';

class SelectedMemberList extends StatelessWidget {
  SelectedMemberList({super.key});
  final groupController = Get.put(GroupController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: groupController.groupMembers
            .map(
              (e) => Stack(
                children: [
                  ///profile image
                  Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: e.profileImage!,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: InkWell(
                      onTap: () {
                        groupController.selectMember(user: e);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
