import 'package:sampark/config/constant.dart';

class ChatTile extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  const ChatTile({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.lastChat,
    required this.lastTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Image.asset(imgUrl, width: 50),
          const Gap(5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                lastChat,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          const Spacer(),

          ///time
          Text(
            lastTime,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
