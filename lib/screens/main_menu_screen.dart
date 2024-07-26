import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    game.bird.getMute();
    game.bird.getBestScore();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.webp"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        game.overlays.add('setting');
                      },
                      child: const Icon(
                        Icons.settings,
                        color: Colors.brown,
                        size: 30,
                      )),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/bird.webp",
                      width: 100,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/bird.webp",
                          width: 100,
                          height: 100,
                        ),
                        Image.asset(
                          "assets/images/bird.webp",
                          width: 100,
                          height: 100,
                        ),
                      ],
                    )
                  ],
                ),
                const Text(
                  'Flying Bird',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: 'Game',
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                const Text(
                  'Tap to start',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.brown,
                    fontFamily: 'Game',
                  ),
                ),
              ],
            )
            // Image.asset(Assets.message),
            ),
      ),
    );
  }
}
