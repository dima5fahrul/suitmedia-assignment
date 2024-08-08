import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FirstController extends GetxController {
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  void palindromeCondition() {
    final name = nameController.text;
    final cleanedName = name.replaceAll(RegExp(r'\s+'), '').toLowerCase();

    if (cleanedName == cleanedName.split('').reversed.join()) {
      palindromeController.text = 'isPalindrome';
    } else {
      palindromeController.text = 'isNotPalindrome';
    }
  }
}
