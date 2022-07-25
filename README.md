# ScrollShoter minigame

This project is a starting and enging point of test for flutter flame lib usability




## How to use

'''
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void prepareStep() async {

    // LongOperation instance = LongOperation();
    // await instance.make();

    await Future.delayed(const Duration(seconds: 15));

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
    return ScrollShooterGame();
  }
}
'''