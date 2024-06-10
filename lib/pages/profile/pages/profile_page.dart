import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/auth_controller.dart';
import 'package:sampark/pages/profile/widgets/user_info_container.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/update-profile");
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const UserInfoContainer(),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                controller.logoutUser();
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
