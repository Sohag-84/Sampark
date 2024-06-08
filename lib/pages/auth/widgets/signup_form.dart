import 'package:sampark/common%20widgets/primary_button.dart';
import 'package:sampark/config/constant.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///name
        const TextField(
          decoration: InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person_2_outlined),
          ),
        ),
        const Gap(20),

        ///email
        const TextField(
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const Gap(20),

        ///password
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
          btnName: "SIGN UP",
          icon: Icons.lock_open,
        ),
      ],
    );
  }
}
