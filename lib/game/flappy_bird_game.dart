import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flying_bird/components/background.dart';
import 'package:flying_bird/components/bird.dart';
import 'package:flying_bird/components/ground.dart';
import 'package:flying_bird/components/pipe_group.dart';
import 'package:flying_bird/game/assets.dart';
import 'package:flying_bird/game/configuration.dart';
import 'package:flutter/painting.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  late ButtonComponent setting;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
      // setting = buildSetting(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
        ));
  }

  // ButtonComponent buildSetting() {
  //   return ButtonComponent(
  //     position: Vector2(size.x / 4, size.y / 2 * 0.2),
  //     size: Vector2(100, 100),
  //     anchor: Anchor.center,
  //     onPressed: () {
  //       print('Setting');
  //     },
  //   );
  // }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }
}
