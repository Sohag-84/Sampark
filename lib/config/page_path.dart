import 'package:get/get.dart';
import 'package:sampark/pages/auth/page/auth_page.dart';
import 'package:sampark/pages/chat/page/chat_page.dart';
import 'package:sampark/pages/home/page/home_page.dart';

var pagePath = [
  GetPage(
    name: "/auth-page",
    page: () => const AuthPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/home",
    page: () => const HomePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/chat",
    page: () => const ChatPage(),
    transition: Transition.rightToLeft,
  ),
];
