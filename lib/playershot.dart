import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import 'main_game.dart';


class PlayerShot extends PositionComponent  with HasGameRef<SpaceShooterGame>{
  static final _paint = Paint()..color = Colors.white;
  
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
    move(Vector2(0, -3));
    var distance = SpaceShooterGame.boss.position - position;
    if(distance.length <= 60){
      debugPrint("contact");
      gameRef.remove(this);
    }
  }
}
