import 'package:fluttertoast/fluttertoast.dart';
import 'package:sampark/common%20widgets/primary_button.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/controller/auth_controller.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    final AuthController controller = Get.put(AuthController());

    return Column(
      children: [
        ///name
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: "Full Name",
            prefixIcon: Icon(Icons.person_2_outlined),
          ),
        ),
        const Gap(20),

        ///email
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const Gap(20),

        ///password
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
                    if (nameController.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Name can't be empty");
                      return;
                    }
                    if (emailController.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Email can't be empty");
                      return;
                    }
                    if (passwordController.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Password can't be empty");
                      return;
                    }
                    controller.createUser(
                      email: emailController.text,
                      password: passwordController.text,
                      name: nameController.text,
                    );
                  },
                  btnName: "SIGN UP",
                  icon: Icons.lock_open,
                );
        }),
      ],
    );
  }
}
