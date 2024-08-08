import 'package:get/get.dart';
import 'package:suitmedia_assignment/screens/first_screen/first_screen.dart';
import 'package:suitmedia_assignment/screens/second_screen/second_screen.dart';

import '../screens/first_screen/first_binding.dart';
import '../screens/second_screen/second_binding.dart';
import '../screens/third_screen/third_binding.dart';
import '../screens/third_screen/third_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(
        name: RouteName.firstScreen,
        page: () => const FirstScreen(),
        binding: FirstBinding()),
    GetPage(
        name: RouteName.secondScreen,
        page: () => const SecondScreen(),
        binding: SecondBinding()),
    GetPage(
        name: RouteName.thirdScreen,
        page: () => const ThirdScreen(),
        binding: ThirdBinding()),
  ];
}

abstract class RouteName {
  static const firstScreen = '/first-screen';
  static const secondScreen = '/second-screen';
  static const thirdScreen = '/third-screen';
}
