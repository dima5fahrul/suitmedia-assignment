import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_assignment/screens/first_screen/first_screen.dart';
import 'package:suitmedia_assignment/screens/second_screen/second_controller.dart';

import '../../routes/routes.dart';

class SecondScreen extends GetView<SecondController> {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Second Screen',
              style: Get.textTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Get.back())),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: Get.width,
        height: Get.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Welcome'),
                Obx(() => Text(
                      controller.name.value,
                      style: Get.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
              ]),
              Align(
                  alignment: Alignment.center,
                  child: Obx(() => Text(
                        controller.name.value == 'No User Selected'
                            ? 'No User Selected'
                            : 'Selected User Name',
                        style: Get.textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ))),
              CommonButton(
                  onPressed: () => Get.toNamed(RouteName.thirdScreen),
                  text: 'Choose a User',
                  color: const Color(0xFF2B637B))
            ]),
      ),
    );
  }
}
