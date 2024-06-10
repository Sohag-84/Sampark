import 'package:sampark/config/constant.dart';

Widget profileIconContainer({
  required BuildContext context,
  required VoidCallback onTap,
  required String iconImage,
  required String text,
  required Color color,
}) {
  final theme = Theme.of(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconImage,
            width: 25,
            color: color,
          ),
          const Gap(5),
          Text(
            text,
            style: TextStyle(color: color),
          ),
        ],
      ),
    ),
  );
}
