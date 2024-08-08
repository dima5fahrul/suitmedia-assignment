import 'package:get/get.dart';

import '../third_screen/user_model.dart';

class SecondController extends GetxController {
  User? user;
  RxString name = 'No User Selected'.obs;

  void setUser(User? user) {
    this.user = user;
    name.value = "${user?.firstName} ${user?.lastName}";
  }
}
