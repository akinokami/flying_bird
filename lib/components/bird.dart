import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flying_bird/game/bird_movement.dart';
import 'package:flying_bird/game/assets.dart';
import 'package:flying_bird/game/configuration.dart';
import 'package:flying_bird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;
  int bestScore = 0;
  bool isNotMuted = false;

  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);

    gameRef.bird;

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.up: birdUpFlap,
      BirdMovement.down: birdDownFlap,
    };

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate),
        onComplete: () => current = BirdMovement.down,
      ),
    );
    if (isNotMuted) {
      FlameAudio.play(Assets.flying);
    }
    current = BirdMovement.up;
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    gameOver();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void gameOver() {
    if (isNotMuted) {
      FlameAudio.play(Assets.collision);
    }
    game.isHit = true;
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    if (score > bestScore) {
      bestScore = score;
      final box = GetStorage();
      box.write('bestScore', bestScore);
    }
  }

  void getBestScore() {
    final box = GetStorage();
    bestScore = box.read('bestScore') ?? 0;
  }

  void getMute() {
    final box = GetStorage();
    isNotMuted = box.read('isNotMuted') ?? false;
  }

  void muteUnmute(mute) {
    isNotMuted = mute;
    final box = GetStorage();
    box.write('isNotMuted', isNotMuted);
    print("isNotMuted>>>$mute");
  }
}
