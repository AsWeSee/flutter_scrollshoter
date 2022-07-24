library minigame_scrollshooter_loadingscreen;

import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

import 'main_game.dart';

class ScrollShooterGame extends StatefulWidget {
  const ScrollShooterGame({Key? key}) : super(key: key);

  @override
  State<ScrollShooterGame> createState() => _ScrollShooterGameState();
}

class _ScrollShooterGameState extends State<ScrollShooterGame> {
 
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: SpaceShooterGame());
  }
}
