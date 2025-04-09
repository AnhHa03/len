import 'package:flutter/material.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:len/core/values/app_colors.dart';
import 'package:len/modules/root_view/view/root_view_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {

  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //designSize: AppConstant.designSize,
      builder: (context, child) => GetMaterialApp(
      smartManagement: SmartManagement.full,
      showPerformanceOverlay: false,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary40,
        ),
        useMaterial3: true,
      ),
      home: RootViewScreen(),
      ),
    );
  }
}
