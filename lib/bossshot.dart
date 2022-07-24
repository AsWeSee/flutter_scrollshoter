import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import 'main_game.dart';

class BossShot extends PositionComponent  with HasGameRef<SpaceShooterGame>{
  static final _paint = Paint()..color = const Color.fromARGB(255, 161, 29, 29);
  
  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  @override
  void update(double dt) {
    super.update(dt);
    move(Vector2(0, 2));
    var distance = SpaceShooterGame.player.position - position;
    if(distance.length <= 40){
      debugPrint("boss contact");
      gameRef.remove(this);
    }
  }
}
