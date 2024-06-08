import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/welcome/widgets/welcom_body.dart';
import 'package:sampark/pages/welcome/widgets/welcome_footer_button.dart';
import 'package:sampark/pages/welcome/widgets/welcome_heading.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WelcomeHeading(),
              WelcomBody(),
              WelcomeFooterButton(),
            ],
          ),
        ),
      ),
    );
  }
}
