import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          onTap: () {},
          imgUrl: AssetsImage.defaultProfileUrl,
          name: "Raiyan",
          lastChat: "Assalamo alaikom",
          lastTime: "10 PM",
        ),
      ],
    );
  }
}
