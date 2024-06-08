import 'package:get/get.dart';
import 'package:sampark/pages/auth/auth_page.dart';

var pagePath = [
  GetPage(
    name: "/auth-page",
    page: () => const AuthPage(),
    transition: Transition.rightToLeft,
  ),
];
