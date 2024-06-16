import 'package:sampark/config/constant.dart';
import 'package:sampark/models/user_model.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupMembers = <UserModel>[].obs;

  void selectMember({required UserModel user}) {
    if (groupMembers.contains(user)) {
      groupMembers.remove(user);
    } else {
      groupMembers.add(user);
    }
  }
}
