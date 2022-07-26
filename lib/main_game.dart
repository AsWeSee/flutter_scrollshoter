import 'dart:async';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';

import 'boss.dart';
import 'player.dart';

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

    Vector2 vecposition = Vector2(size.x/2,120);
    boss = Boss(this)
      ..position = vecposition
      ..width = 80
      ..height = 80
      ..anchor = Anchor.center
      ..settarget(vecposition);

    add(boss);
  }

  void addEntity(var entity){
    add(entity);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.game);
    boss.move(info.delta.game);
  }
}
