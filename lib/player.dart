import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import 'main_game.dart';
import 'playershot.dart';

class Player extends PositionComponent  with HasGameRef<SpaceShooterGame> {
  static final _paint = Paint()..color = Colors.yellow;
  
  var shootCounter = 0;
  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    shootCounter++;
    
    if (shootCounter >= 50){
      shootCounter = 0;

      PlayerShot shot = PlayerShot()
      ..position = position
      ..width = 5
      ..height = 10
      ..anchor = Anchor.center;

      gameRef.add(shot);
    }
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
