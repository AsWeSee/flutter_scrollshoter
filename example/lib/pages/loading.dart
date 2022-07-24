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

import '../components/rocket_component.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void prepareStep() async {
    // LongOperation instance = LongOperation();
    // await instance.make();

    // await Future.delayed(Duration(seconds: 3));
    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   'argument1': "something",
    // });
  }

  @override
  void initState() {
    super.initState();
    prepareStep();
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: SpaceShooterGame());
  }
}


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

class Boss extends PositionComponent  with HasGameRef<SpaceShooterGame>{
  static final _paint = Paint()..color = Colors.red;
  
  var shootCounter = 0;
  Vector2 targetposition = Vector2.zero();
  
  Boss(SpaceShooterGame game);

  void settarget(Vector2 size){

    targetposition = Vector2(size.x/2, 60);
    debugPrint(targetposition.toString());
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

class SpaceShooterGame extends FlameGame with PanDetector {
  static late Player player;
  static late Boss boss;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    Vector2 plposition = Vector2(size.x/2,size.y-70);
    player = Player()
      ..position = plposition
      ..width = 50
      ..height = 100
      ..anchor = Anchor.center;

    add(player);

    Vector2 vecposition = Vector2(size.x/2,60);
    boss = Boss(this)
      ..position = vecposition
      ..width = 80
      ..height = 80
      ..anchor = Anchor.center
      ..settarget(size);

    add(boss);
  }

  void addEntity(var entity){
    add(entity);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.game);
    boss.move(info.delta.game);
  }
}



// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Flame.device.setLandscape();

//   final game = MoonlanderGame();

//   runApp(GameWidget(game: game));
// }

// /// This class encapulates the whole game.
// class MoonlanderGame extends FlameGame with HasCollidables {
//   @override
//   Future<void> onLoad() async {
//     unawaited(add(RocketComponent(position: size / 2, size: Vector2.all(20))));

//     return super.onLoad();
//   }
// }

// class MyCollidable extends PositionComponent with RectangleHitbox, {
//   MyCollidable() {
//     // This could also be done in onLoad instead of in the constructor
//     final shape = HitboxPolygon([
//       Vector2(0, 1),
//       Vector2(1, 0),
//       Vector2(0, -1),
//       Vector2(-1, 0),
//     ]);
//     addHitbox(shape);
//   }
// }