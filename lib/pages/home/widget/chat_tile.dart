import 'package:cached_network_image/cached_network_image.dart';
import 'package:sampark/config/constant.dart';

class ChatTile extends StatelessWidget {
  final VoidCallback onTap;
  final String imgUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  const ChatTile({
    super.key,
    required this.onTap,
    required this.imgUrl,
    required this.name,
    required this.lastChat,
    required this.lastTime,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  ///profile image
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: imgUrl,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const Gap(5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          lastChat,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),

                  ///time
                  Text(
                    lastTime,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
