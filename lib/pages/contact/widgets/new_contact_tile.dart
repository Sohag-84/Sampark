import 'package:sampark/config/constant.dart';

class NewContactTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String btnName;
  const NewContactTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child:  Icon(
                icon,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            Text(
             btnName,
              style: theme.textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
