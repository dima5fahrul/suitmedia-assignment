import 'package:get/get.dart';
import 'package:suitmedia_assignment/screens/second_screen/second_controller.dart';

class SecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SecondController());
  }
}
