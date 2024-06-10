import 'package:get/get.dart';
import 'package:sampark/pages/auth/page/auth_page.dart';
import 'package:sampark/pages/chat/page/chat_page.dart';
import 'package:sampark/pages/home/page/home_page.dart';
import 'package:sampark/pages/profile/pages/profile_page.dart';
import 'package:sampark/pages/profile/pages/update_profile.dart';

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
  GetPage(
    name: "/profile",
    page: () => ProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/update-profile",
    page: () => const UpdateProfile(),
    transition: Transition.rightToLeft,
  ),
];
