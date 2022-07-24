import 'package:flutter/material.dart';
import 'package:minigame_scrollshooter_loadingscreen/minigame_scrollshooter_loadingscreen.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

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
    return const ScrollShooterGame();
  }
}
