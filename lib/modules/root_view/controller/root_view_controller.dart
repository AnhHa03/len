import 'package:flutter/material.dart';
import 'package:len/modules/home/views/home_screen.dart';
import 'package:get/get.dart';

class RootViewController extends GetxController {
  late PageController pageController;
  var currentPage = Rx<int>(0);
  var isRead = Rx<bool>(false);
  var isReadList = Rx<List<String>>([]);
  final text = TextEditingController();

  final screens = [
    HomeScreen(),
    // ProfileScreen(),
  ];

  @override
  void onInit() async {
    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => HomeScreen());
    // Get.lazyPut(() => ChatAIScreen());
    // Get.lazyPut(() => ProfileScreen());

    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onChangePage(int index) {
    currentPage.value = index;
    pageController.jumpToPage(index);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
