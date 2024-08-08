import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_assignment/screens/third_screen/user_model.dart';

class ThirdController extends GetxController {
  UserModel? userModel;
  int? totalPages;
  RxInt currentPage = 1.obs;
  var endpoint = 'https://reqres.in/api/users?page=';
  List<User> users = [];
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    readJson();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          currentPage < totalPages!) {
        loadMoreData();
      }
    });
  }

  void loadMoreData() {
    if (currentPage < totalPages!) {
      currentPage++;
      readJson();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> readJson() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse("$endpoint$currentPage"));
    final data = json.decode(response.body);
    userModel = UserModel.fromJson(data);
    totalPages = userModel!.totalPages;
    users.addAll(userModel!.data);
    isLoading.value = false;
    update();
  }

  Widget loadMore() {
    if (currentPage.value == totalPages) {
      return const SizedBox();
    }
    return TextButton(
      onPressed: () => loadMoreData(),
      child: const Text('Load More'),
    );
  }
}
