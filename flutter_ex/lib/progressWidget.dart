import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressWidget extends StatefulWidget {
  ProgressWidget({Key key}) : super(key: key);

  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> with SingleTickerProviderStateMixin {
  AnimationController _animateController;
  
  @override
  void initState() { 
    _animateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    _animateController.forward();
    _animateController.addListener(
      () => setState((){})
    );
    super.initState();
  }

  @override
  void dispose() {
    _animateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(100),
        child: Column(
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(
                begin: Colors.grey,
                end: Colors.blue
              ).animate(_animateController),
              value: _animateController.value,
            )
          ],
        ),
      ),
    );
  }
}