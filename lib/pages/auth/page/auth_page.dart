import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/auth/widgets/auth_page_body.dart';
import 'package:sampark/pages/welcome/widgets/welcome_heading.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              WelcomeHeading(),
              Gap(40),
              AuthPageBody(),
            ],
          ),
        ),
      )),
    );
  }
}
