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

import 'mainGame.dart';


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
