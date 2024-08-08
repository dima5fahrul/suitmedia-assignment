import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import 'first_controller.dart';

class FirstScreen extends GetView<FirstController> {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background.png',
              fit: BoxFit.cover, width: Get.width, height: Get.height),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/profile-image.png', width: 120),
                const SizedBox(height: 50),
                _CommonForm(
                    title: 'Name', textController: controller.nameController),
                const SizedBox(height: 10),
                _CommonForm(
                    title: 'Palindrome',
                    textController: controller.palindromeController),
                const SizedBox(height: 20),
                CommonButton(
                    onPressed: () => controller.palindromeCondition(),
                    text: 'CHECK',
                    color: const Color(0xFF2B637B)),
                const SizedBox(height: 10),
                CommonButton(
                    onPressed: () => Get.toNamed(RouteName.secondScreen),
                    text: 'NEXT',
                    color: const Color(0xFF2B637B))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CommonForm extends StatelessWidget {
  final String title;
  final TextEditingController textController;

  const _CommonForm({
    required this.title,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: 1,
        minLines: 1,
        textAlignVertical: TextAlignVertical.bottom,
        obscureText: false,
        controller: textController,
        decoration: InputDecoration(
            hintText: title,
            hintStyle: const TextStyle(color: Colors.grey),
            constraints: const BoxConstraints(maxHeight: 48),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.transparent, width: 1)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.transparent, width: 1))));
  }
}

class CommonButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double? width;
  final Color? color;

  const CommonButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            foregroundColor: Colors.white,
            backgroundColor: color ?? Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
