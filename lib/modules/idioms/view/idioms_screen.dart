import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:len/core/models/idiom.dart';
import 'package:len/core/values/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:len/core/values/image_assets.dart';
import 'package:len/modules/idioms/controller/idioms_screen_controller.dart';
import 'package:len/modules/idioms/widgets/item_idioms.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdiomsScreen extends StatelessWidget {
  const IdiomsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final IdiomsScreenController idiomsScreenController = Get.put(IdiomsScreenController());

     return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: _buildBody(idiomsScreenController),
      ),
    );
  }

 Container _buildBody (
    IdiomsScreenController controller,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.gray60],
        ),
      ),
      child: Column(
        children: [
          TextField (
            textInputAction: TextInputAction.search,
            style:
              const TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
            controller: controller.searchTextController,
            onChanged: controller.onChangeSearchText,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary40), 
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary40),              
              ),          
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(ImageAssets.icSearch),
              ),
              hintText: "Tìm kiếm",
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray20,
                  fontSize: 16.0),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),            
              prefixIconConstraints: const BoxConstraints(),
              suffixIcon: Obx(() => Visibility( 
                visible: controller.showSuffixIcon.value,
                child: GestureDetector(
                  onTap: () {
                    controller.clearSearchText();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SvgPicture.asset(ImageAssets.icClose),
                  ),
                ),
              ),),
              suffixIconConstraints: const BoxConstraints(),
            ),
          ),
          
          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: Obx(() =>SingleChildScrollView(  
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                constraints: BoxConstraints(minHeight: Get.height),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: controller.searched_list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 1.h),
                  itemBuilder: (context, index) {
                    Idiom verb = controller.searched_list[index];
                    return ItemIdioms(
                      idioms: verb.idiom,
                      translatedIdioms: verb.meaning,
                    );
                  },
                ),
              ),
            ),),
          ),
        ],                  
      ),
    );  
  }

  AppBar _buildAppBar(
    BuildContext context
  ) {
    return AppBar(
      leading: IconButton(          
        icon: SvgPicture.asset(ImageAssets.icBack),
        onPressed: () {
          Navigator.pop(context); 
        },
      ),

      centerTitle: true,
      title: const Text (
        'Thành ngữ Tiếng Anh',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

    backgroundColor: const Color(0xFFFFFFFF),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(3.0), 
        child: Container(
          color: AppColors.gray60, 
          height: 1.3, 
        ),
      ),
    );
  }
}