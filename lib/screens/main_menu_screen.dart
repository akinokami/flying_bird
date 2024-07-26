import 'dart:io';

import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MainMenuScreen extends StatefulWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  String first = '';

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      final box = GetStorage();
      first = box.read('first') ?? '';
      if (first == '') {
        widget.game.pauseEngine();
        widget.game.overlays.add('policy');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.game.pauseEngine();
    widget.game.bird.getMute();
    widget.game.bird.getBestScore();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          widget.game.overlays.remove('mainMenu');
          widget.game.resumeEngine();
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          exit(0);
                        },
                        child: Image.asset(
                          "assets/images/close.webp",
                          width: 45,
                          height: 45,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.game.overlays.add('setting');
                        },
                        child: Image.asset(
                          "assets/images/settings.webp",
                          width: 45,
                          height: 45,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),
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
                    color: Colors.brown,
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
            )),
      ),
    );
  }
}
