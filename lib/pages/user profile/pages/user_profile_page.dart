import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/auth_controller.dart';
import 'package:sampark/models/user_model.dart';
import 'package:sampark/pages/user%20profile/widgets/user_info_container.dart';

class UserProfilePage extends StatelessWidget {
  final UserModel userModel;
  UserProfilePage({super.key, required this.userModel});

  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/user-update-profile");
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            UserInfoContainer(
              profileImage:
                  userModel.profileImage ?? AssetsImage.defaultProfileUrl,
              userName: userModel.name ?? "",
              userEmail: userModel.email ?? "",
            ),
          ],
        ),
      ),
    );
  }
}
