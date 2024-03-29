import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaggerAnimationWidget extends StatelessWidget {
  StaggerAnimationWidget({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(
      begin: 0,
      end: 300
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.6,
          curve: Curves.ease
        ),
      )
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: 0),
      end: EdgeInsets.only(left: 100)
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1, 
          curve: Curves.ease 
        )
      )
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.6,
          curve: Curves.ease
        )
      )
    );
  }


  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;
  
  final AnimationController controller;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerRoute extends StatefulWidget  {
  StaggerRoute({Key key}) : super(key: key);

  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
    super.initState();
  }

  Future<Null> _playAnimation() async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5)
              )
            ),
            child: StaggerAnimationWidget(
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }
}