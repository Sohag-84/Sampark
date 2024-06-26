import 'package:get/get.dart';
import 'package:sampark/pages/auth/page/auth_page.dart';
import 'package:sampark/pages/contact/page/contact_page.dart';
import 'package:sampark/pages/group/new%20group/page/group_title_page.dart';
import 'package:sampark/pages/group/new%20group/page/new_group.dart';
import 'package:sampark/pages/home/page/home_page.dart';
import 'package:sampark/pages/user%20profile/pages/user_update_profile.dart';
import 'package:sampark/pages/profile/page/profile_page.dart';

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
  // GetPage(
  //   name: "/chat",
  //   page: () => const ChatPage(),
  //   transition: Transition.rightToLeft,
  // ),
  // GetPage(
  //   name: "/user-profile",
  //   page: () => UserProfilePage(),
  //   transition: Transition.rightToLeft,
  // ),
  GetPage(
    name: "/user-update-profile",
    page: () => const UserUpdateProfile(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/profile",
    page: () => ProfilePage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/contact",
    page: () => ContactPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/new-group",
    page: () => NewGroup(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/group-title",
    page: () => GroupTitlePage(),
    transition: Transition.rightToLeft,
  ),
];
