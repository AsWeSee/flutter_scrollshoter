import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import 'bossshot.dart';
import 'main_game.dart';

class Boss extends PositionComponent  with HasGameRef<SpaceShooterGame>{
  static final _paint = Paint()..color = Colors.red;
  
  var shootCounter = 0;
  Vector2 targetposition = Vector2.zero();
  
  Boss(SpaceShooterGame game);

  void settarget(Vector2 targetpos){

    targetposition = targetpos;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
    // debugTextPaint.render(canvas, 'V:$_velocity', Vector2(size.x, 0));
  }

  void move(Vector2 delta) {
    targetposition.add(delta);
    // position.add(Vector2(delta.x, 0));
  }


  
  @override
  void update(double dt) {
    super.update(dt);
    Vector2 movement = (targetposition - position)/30;
    position.add(movement);

    shootCounter++;
    
      if (shootCounter >= 150){
        shootCounter = 0;
        
        BossShot shot = BossShot()
        ..position = position
        ..width = 12
        ..height = 30
        ..anchor = Anchor.center;

        gameRef.add(shot);
      }
    }
    
    
}


