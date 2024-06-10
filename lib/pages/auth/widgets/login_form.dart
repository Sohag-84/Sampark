import 'package:fluttertoast/fluttertoast.dart';
import 'package:sampark/common%20widgets/primary_button.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/auth_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final controller = Get.put(AuthController());
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const Gap(20),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.password),
          ),
        ),
        const Gap(30),

        ///login button
        Obx(() {
          return controller.isLoading.value
              ? const CircularProgressIndicator()
              : PrimaryButton(
                  onTap: () {
                    if (emailController.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Email can't be empty");
                      return;
                    }
                    if (passwordController.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Password can't be empty");
                      return;
                    }
                    controller.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  },
                  btnName: "LOGIN",
                  icon: Icons.lock_open,
                );
        }),
      ],
    );
  }
}
