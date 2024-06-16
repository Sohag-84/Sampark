import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/contact_controller.dart';
import 'package:sampark/controller/group_controller.dart';
import 'package:sampark/pages/group/new%20group/widget/selected_member_list.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class NewGroup extends StatelessWidget {
  NewGroup({super.key});

  final contactController = Get.put(ContactController());
  final groupController = Get.put(GroupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Group"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedMemberList(),
            const Gap(10),
            Text(
              "Contacts on sampark",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Gap(5),

            ///contact list
            Expanded(
              child: StreamBuilder(
                stream: contactController.getContacts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  }
                  if (snapshot.data == null) {
                    return const Center(
                      child: Text(
                        "No Message found",
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final user = snapshot.data![index];
                        return ChatTile(
                          onTap: () {
                            groupController.selectMember(user: user);
                          },
                          imgUrl: user.profileImage ??
                              AssetsImage.defaultProfileUrl,
                          name: user.name ?? "",
                          lastChat: user.about ?? "",
                          lastTime: "",
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
