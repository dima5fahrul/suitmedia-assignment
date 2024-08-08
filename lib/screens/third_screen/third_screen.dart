import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitmedia_assignment/screens/second_screen/second_controller.dart';
import 'package:suitmedia_assignment/screens/third_screen/third_controller.dart';

class ThirdScreen extends GetView<ThirdController> {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Third Screen',
              style: Get.textTheme.headlineSmall!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Get.back()),
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.8,
                child: GetBuilder<ThirdController>(
                  builder: (controller) => Obx(() {
                    return controller.isLoading.value &&
                            controller.users.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : controller.userModel!.data.isEmpty
                            ? const Center(child: Text('No data found'))
                            : RefreshIndicator(
                                onRefresh: () async {
                                  controller.users.clear();
                                  controller.currentPage.value = 1;
                                  await controller.readJson();
                                },
                                child: ListView.separated(
                                  itemCount: controller.users.length,
                                  itemBuilder: (context, index) {
                                    if (index < controller.users.length) {
                                      final user = controller.users[index];
                                      return ListTile(
                                        onTap: () {
                                          Get.find<SecondController>().user =
                                              user;
                                          Get.find<SecondController>()
                                              .setUser(user);
                                          Get.back();
                                        },
                                        leading: CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(user.avatar),
                                        ),
                                        title: Text(
                                            '${user.firstName} ${user.lastName}',
                                            style: Get.textTheme.bodyLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        subtitle: Text(user.email),
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                ),
                              );
                  }),
                ),
              ),
              Obx(() => controller.loadMore()),
            ],
          ),
        ));
  }
}
