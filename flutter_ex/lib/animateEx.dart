
import 'package:flutter/cupertino.dart';

class AnimateImage extends AnimatedWidget {
  AnimateImage({Key key, Animation<double> animation}) : super (key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Image.asset("images/image.png", width: animation.value, height: animation.value);
  }
}

class AnimationWidget extends StatefulWidget {
  AnimationWidget({Key key}) : super(key: key);

  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() { 
    super.initState();
    controller = AnimationController(
      duration:  const Duration(seconds: 3),
      vsync: this
    );

    animation = CurvedAnimation(parent: controller,  curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //    child: Center(
        //  child: Image.asset('images/image.png',
        //  width: animation.value,
        //  height: animation.value),
        // child: AnimateImage(animation: animation),
    //     ),
    //    ),
    // );
    return AnimatedBuilder(
            animation: animation,
            child: Image.asset("images/image.png"),
            builder: (ctx, child) {
              return Center(
                child: Container(
                  child: child,
                  width: animation.value,
                  height: animation.value,
                ),
              );
          });
  }
}