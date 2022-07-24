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


class BossShot extends PositionComponent  with HasGameRef<SpaceShooterGame>{
  static final _paint = Paint()..color = Color.fromARGB(255, 161, 29, 29);
  
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
