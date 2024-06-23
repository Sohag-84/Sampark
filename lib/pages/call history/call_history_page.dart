import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/chat_controller.dart';
import 'package:sampark/models/audio_call_model.dart';
import 'package:sampark/pages/home/widget/chat_tile.dart';

class CallHistoryPage extends StatelessWidget {
  CallHistoryPage({super.key});
  final chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: chatController.getCalls(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                CallModel data = snapshot.data![index];
                return ChatTile(
                  onTap: () {},
                  imgUrl: data.receiverPic ?? AssetsImage.defaultProfileUrl,
                  name: data.receiverName ?? "",
                  lastChat: data.time ?? "",
                  lastTime: data.time ?? "",
                );
              },
            );
          }
        });
  }
}
