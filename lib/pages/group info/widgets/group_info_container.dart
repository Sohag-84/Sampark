import 'package:cached_network_image/cached_network_image.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/profile_controller.dart';
import 'package:sampark/pages/user%20profile/widgets/profile_icon_container.dart';

class GroupInfoContainer extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  GroupInfoContainer({
    super.key,
    required this.profileImage,
    required this.userName,
    required this.userEmail,
  });
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: profileImage,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userEmail,
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
                const Gap(20),

                ///call || chat || delete button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///call
                    profileIconContainer(
                      context: context,
                      onTap: () {},
                      iconImage: AssetsImage.profileAudioCall,
                      text: "Call",
                      color: Colors.green,
                    ),

                    ///Video call
                    profileIconContainer(
                      context: context,
                      onTap: () {},
                      iconImage: AssetsImage.profileVideoCall,
                      text: "Video",
                      color: const Color(0xFFFF9900),
                    ),

                    ///chat
                    profileIconContainer(
                      context: context,
                      onTap: () {},
                      iconImage: AssetsImage.groupAddUser,
                      text: "Add",
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
