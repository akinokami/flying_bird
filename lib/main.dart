import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flying_bird/screens/main_menu_screen.dart';
import 'package:flying_bird/screens/policy_screen.dart';
import 'package:flying_bird/screens/setting_screen.dart';
import 'package:flying_bird/screens/splash_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/game_over_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await GetStorage.init();
  // final game = FlappyBirdGame();
  // runApp(
  //   GameWidget(
  //     game: game,
  //     initialActiveOverlays: const [MainMenuScreen.id],
  //     overlayBuilderMap: {
  //       'mainMenu': (context, _) => MainMenuScreen(game: game),
  //       'gameOver': (context, _) => GameOverScreen(game: game),
  //       'setting': (context, _) => SettingScreen(game: game),
  //       //'policy': (context, _) => PolicyScreen(game: game),
  //     },
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flying Bird',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
