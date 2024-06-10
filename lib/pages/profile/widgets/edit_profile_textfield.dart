import 'package:sampark/config/constant.dart';

Column editProfileTextField({
  required BuildContext context,
  required String title,
  required IconData prefixIcon,
  required String hintText,
  TextInputAction textInputAction = TextInputAction.next,
}) {
  final theme = Theme.of(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: theme.textTheme.bodyMedium,
      ),
      const Gap(10),
      TextField(
        textInputAction: textInputAction,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
        ),
      ),
    ],
  );
}
