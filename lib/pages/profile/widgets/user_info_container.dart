import 'package:sampark/config/constant.dart';

import 'profile_icon_container.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({super.key});

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
                    Image.asset(AssetsImage.boyPic),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "IH Sohag",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "sohag@gmail.com",
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

                    ///Chat
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
                      iconImage: AssetsImage.appIconSVG,
                      text: "Chat",
                      color: const Color(0xFF0057FF),
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
