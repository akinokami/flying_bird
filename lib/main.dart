import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flying_bird/global.dart';
import 'package:flying_bird/language/languages.dart';
import 'package:flying_bird/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    Global.language = box.read('language') ?? "zh";
    return GetMaterialApp(
      title: 'Flying Bird',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        ),
      ),
      translations: Languages(),
      locale: Global.language == 'zh'
          ? const Locale('zh', 'CN')
          : Global.language == 'vi'
              ? const Locale('vi', 'VN')
              : const Locale('en', 'US'),
      fallbackLocale: const Locale('zh', 'CN'),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
