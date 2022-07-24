import 'dart:async';
import 'dart:html';

import 'package:flame/collisions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';

import 'bossshot.dart';
import 'mainGame.dart';

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


