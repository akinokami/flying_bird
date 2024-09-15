import 'package:flying_bird/game/assets.dart';
import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${'score'.tr}: ${game.bird.score}",
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            Text(
              "${'best_score'.tr}: ${game.bird.bestScore}",
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                game.bird.reset();
                game.overlays.remove('gameOver');
                game.overlays.add('mainMenu');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text(
                'home'.tr,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     game.overlays.add('setting');
            //   },
            //   style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            //   child: Text(
            //     'setting'.tr,
            //     style: const TextStyle(fontSize: 18),
            //   ),
            // ),
            // const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: Text(
                'restart'.tr,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
