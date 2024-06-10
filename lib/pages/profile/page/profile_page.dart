import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/profile/widgets/user_info_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            UserInfoContainer(),
          ],
        ),
      ),
    );
  }
}
