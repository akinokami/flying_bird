import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flying_bird/screens/game_over_screen.dart';
import 'package:flying_bird/screens/main_menu_screen.dart';
import 'package:flying_bird/screens/setting_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      final game = FlappyBirdGame();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => GameWidget(
            game: game,
            initialActiveOverlays: const [MainMenuScreen.id],
            overlayBuilderMap: {
              'mainMenu': (context, _) => MainMenuScreen(game: game),
              'gameOver': (context, _) => GameOverScreen(game: game),
              'setting': (context, _) => SettingScreen(game: game),
              //'policy': (context, _) => PolicyScreen(game: game),
            },
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/bird.webp',
              height: MediaQuery.of(context).size.height * 0.20,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Flying Bird',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Game',
                color: Colors.brown,
              ),
              // style: const TextStyle(fontSize: 12)
            ),
            //  CustomText(
            //     text: 'Mega Change Game',
            //     size: 18,
            //     fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          LoadingAnimationWidget.inkDrop(
            color: Colors.brown,
            size: 36,
          ),
        ],
      ),
    );
  }
}
