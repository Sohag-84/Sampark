import 'package:sampark/common%20widgets/primary_button.dart';
import 'package:sampark/config/constant.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const Gap(20),
        const TextField(
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password),
          ),
        ),
        const Gap(30),

        ///login button
        PrimaryButton(
          onTap: () {},
          btnName: "LOGIN",
          icon: Icons.lock_open,
        ),
      ],
    );
  }
}
