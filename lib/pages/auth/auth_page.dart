import 'package:flutter/material.dart';
import 'package:sampark/config/constant.dart';
import 'package:sampark/pages/auth/widgets/auth_page_body.dart';
import 'package:sampark/pages/welcome/widgets/welcome_heading.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            WelcomeHeading(),
            const Gap(40),
            AuthPageBody(),
            ],
        ),
      )),
    );
  }
}
