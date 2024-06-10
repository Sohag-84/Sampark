import 'package:sampark/config/constant.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                debugPrint(value);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Contact search",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
