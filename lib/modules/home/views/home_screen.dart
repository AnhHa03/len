import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:len/core/values/app_colors.dart';
import 'package:len/core/values/image_assets.dart';
import 'package:len/modules/idioms/view/idioms_screen.dart';
import 'package:len/modules/irregular_verbs/views/irregular_verbs_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final double _appBarheight = math.min(
    AppBar().preferredSize.height,
    Get.statusBarHeight,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.fromLTRB(20, _appBarheight * 1.2, 20, 20),
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.bgHome), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Xin chào,',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16.0),
            ),
            const SizedBox(height: 4),
            Text(
              "Hà Mai Anh", //user_fullname
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 22.0),
            ),
            const SizedBox(
              height: 20,
            ),
            
            TextField(
                  //controller: suggessController,
                  // focusNode: focusNode,
                  // onChanged: (value) {},
                  // onSubmitted: (value) {
                  //   //homeController.showBottomSheet(context, value);
                  //   //suggessController.clear();
                  // },
                  decoration: InputDecoration(
                    isDense: true,
                    isCollapsed: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Tra từ điển",
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray20,
                        fontSize: 16.0),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(ImageAssets.icSearch),
                    ),
                    prefixIconConstraints: const BoxConstraints(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        //controller.clear();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SvgPicture.asset(ImageAssets.icClose),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(),
                  ),
                ),

            const SizedBox(
              height: 20,
            ),            
          ],
        ),
      ),
      Positioned.fill(
        top: 260,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Từ vựng",
                  style: TextStyle(
                      color: AppColors.primary20,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColors.secondary90,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.bannerVocab),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Hãy bắt đầu học để ghi nhớ từ trong kho từ vựng của bạn ngay bây giờ!",
                            style: TextStyle(
                                color: AppColors.primary20,
                                fontWeight: FontWeight.w600,
                                fontSize: 10),
                            textAlign: TextAlign.end,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              //Get.to(() => VocabScreen());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: AppColors.secondary20,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Text(
                                "Đến Kho từ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),const Text(
                  "Lộ trình học",
                  style: TextStyle(
                      color: AppColors.primary20,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => IdiomsScreen()),
                          // );
                        },
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 150),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: AppColors.secondary80,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            children: [
                              SvgPicture.asset(ImageAssets.icGrammar),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Grammar",
                                style: TextStyle(
                                    color: AppColors.primary20,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Ngữ pháp",
                                style: TextStyle(
                                    color: AppColors.primary20, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => IrregulerVerbs()),
                          // );
                        },
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 150),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color(0xFFEBFFDE),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(ImageAssets.icSpeak),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Speaking",
                                style: TextStyle(
                                  color: AppColors.primary20,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: const Text(
                                  "Kỹ năng nói",
                                  style: TextStyle(
                                    color: AppColors.primary20,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Nguồn học",
                  style: TextStyle(
                      color: AppColors.primary20,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child:
                            sourceItem("Sơ lược \nngữ pháp", ImageAssets.icBook, () {
                      //Get.to(() => GrammarScreen());
                    })),
                    Expanded(
                        child: sourceItem("Thành ngữ\n Tiếng Anh", ImageAssets.icIdiom, () {
                        Get.to(() => IdiomsScreen());
                    })),
                    Expanded(
                        child: sourceItem("Động từ \nbất quy tắc", ImageAssets.icIrrVerb, () {
                       Get.to(() => IrregularVerbsScreen());
                    })),
                    // Expanded(
                    //     child: sourceItem("Ngữ pháp", ImageAssets.icGrammar,
                    //         () async {
                    //   //Get.to(() => ListGrammaScreen());
                    // })),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget sourceItem(String title, String icon, Function onPress) {
    return InkWell(      
      onTap: () => onPress(),
      child: Column(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(
            height: 8,
          ),
          Text(
              title,
              style: const TextStyle(
                color: AppColors.primary20,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}

