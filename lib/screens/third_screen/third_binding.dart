import 'package:get/get.dart';
import 'package:suitmedia_assignment/screens/third_screen/third_controller.dart';

class ThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ThirdController());
  }
}
