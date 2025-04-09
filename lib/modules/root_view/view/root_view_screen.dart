import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:len/core/values/app_colors.dart';
import 'package:len/modules/root_view/controller/root_view_controller.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/values/image_assets.dart';

class RootViewScreen extends StatelessWidget {
  const RootViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rootViewController = Get.put(RootViewController(), permanent: true);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: PageView(
          onPageChanged: (value) => rootViewController.animateToTab(value),
          controller: rootViewController.pageController,
          // physics: const NeverScrollableScrollPhysics(),
          children: rootViewController.screens,
        ),
        bottomNavigationBar: Obx(
          () => SalomonBottomBar(
            currentIndex: rootViewController.currentPage.value,
            onTap: (value) {
              rootViewController.onChangePage(value);
            },
            items: [
              SalomonBottomBarItem(
                  icon: SvgPicture.asset(ImageAssets.icHome),
                  title: const Text("Trang chủ"),
                  selectedColor: AppColors.primary40,
                  activeIcon: SvgPicture.asset(ImageAssets.icHomeFill)),             
              SalomonBottomBarItem(
                  icon: SvgPicture.asset(ImageAssets.icMic),
                  title: const Text("Luyện nói"),
                  selectedColor: AppColors.primary40,
                  activeIcon: SvgPicture.asset(ImageAssets.icMicFill)), 
              SalomonBottomBarItem(
                  icon: SvgPicture.asset(ImageAssets.icAccount),
                  title: const Text("Tài khoản"),
                  selectedColor: AppColors.primary40,
                  activeIcon: SvgPicture.asset(ImageAssets.icAccountFill)),
            ],
          ),
        ),
      ),
    );
  }
}
