// ignore_for_file: unused_local_variable

import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/contact_controller.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/pages/group/group_page.dart';
import 'package:sampark/pages/home/widget/chat_list.dart';
import 'package:sampark/pages/home/widget/home_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    final profileController = Get.put(ProfileController());
    final contactController = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppString.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(AssetsImage.appIconSVG),
        ),
        actions: [
          IconButton(
            onPressed: () {
              contactController.getChatRoomList();
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed("/profile");
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: homeTabBar(
          tabController: tabController,
          context: context,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contact");
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),
            GroupPage(),
            const Center(child: Text("Calls")),
          ],
        ),
      ),
    );
  }
}
