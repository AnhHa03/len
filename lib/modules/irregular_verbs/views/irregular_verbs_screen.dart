import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:len/core/models/irregular_verb.dart';
import 'package:len/core/values/app_colors.dart';
import 'package:len/core/values/image_assets.dart';
import 'package:len/modules/irregular_verbs/controller/irregular_verbs_controller.dart';
import 'package:len/modules/irregular_verbs/widgets/item_irrelugar_verbs.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IrregularVerbsScreen extends StatelessWidget {
  const IrregularVerbsScreen({super.key});
    
  
  @override
  Widget build(BuildContext context){
    final IrregularVerbScreenController controller = Get.put(IrregularVerbScreenController());
    
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: _buildAppBar(context),
        body: _buildBody( controller),
      ),
    );
  }

  Container _buildBody(
    IrregularVerbScreenController controller
  ) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
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
              )),
              suffixIconConstraints:const  BoxConstraints(),
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          Row(                    
            mainAxisAlignment: MainAxisAlignment.spaceBetween,    
            children: [     
              Container(     
                width: 85.0,          
                height: 50.0,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.0,),
                decoration: BoxDecoration(
                  color: AppColors.secondary20,
                  borderRadius: BorderRadius.circular(12.0),
                ),                
                child: const Text(
                  "Động từ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),

              Container(
                width: 85.0,          
                height: 50.0,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15.0,),
                decoration: BoxDecoration(
                  color: AppColors.secondary20,
                  borderRadius: BorderRadius.circular(12.0),
                ),                
                child: const Text(
                  "Quá khứ đơn",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),

              Container(
                width: 85.0,       
                height: 50.0,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15.0,),
                decoration: BoxDecoration(
                  color: AppColors.secondary20,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  "Quá khứ phân từ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),                  
                  maxLines: 2,
                ),
              ),

              Container(
                width: 85.0,       
                height: 50.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.secondary20,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  "Nghĩa",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 12,
          ),

          Expanded(
            child:Obx(() => 
              SingleChildScrollView(    
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Container(
                  constraints: BoxConstraints(minHeight: Get.height),
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 2.h),
                    itemCount: controller.searched_list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      IrregularVerb verb = controller.searched_list[index];
                      return ItemIrregularVerbs(
                        infinitive: verb.infinitive,
                        pastSimple: verb.pastSimple,
                        pastParticiple: verb.pastParticiple,
                        meaning: verb.meaning,
                      );
                    },
                  ),
                ),
              ), 
            )
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
        'Động từ bất quy tắc',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      backgroundColor: const Color(0xFFFFFFFF),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(3.0), 
        child: Container(
          color: AppColors.gray60, 
          height: 1.3, 
        ),
      ),
    );
  }
}