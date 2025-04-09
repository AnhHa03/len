
import 'package:len/modules/root_view/controller/root_view_controller.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_plus/translator_plus.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  configureHelper();
  configureController();
}

void configureHelper() async {
  getIt.registerSingleton<FlutterTts>(FlutterTts());
  getIt.registerSingleton<GoogleTranslator>(GoogleTranslator());
  getIt.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  await GetIt.instance.isReady<SharedPreferences>(); // Add this line
}

void configureController() async {
  getIt.registerSingleton<RootViewController>(RootViewController(),signalsReady: true);

}
