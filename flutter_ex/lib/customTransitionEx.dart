import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedDecorateBox1 extends StatefulWidget {
  AnimatedDecorateBox1({
    Key key,
    @required this.decoration,
    this.curve = Curves.linear,
    @required this.duration,
    this.child,
    this.reverseDuration
  }) : super(key: key);

  _AnimatedDecorateBox1State createState() => _AnimatedDecorateBox1State();

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;
}

class _AnimatedDecorateBox1State extends State<AnimatedDecorateBox1> with SingleTickerProviderStateMixin {

  
  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> _animation;
  Animation<double> get animation => _animation;

  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this
    );

    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null) {
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    } else {
      _animation = _controller;
    }
  }

  @override
  void didUpdateWidget(AnimatedDecorateBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) {
      _updateCurve();
    }
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;

        _controller
          ..value = 0
          ..forward();
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


class MyCustomTransition extends StatefulWidget {
  MyCustomTransition({Key key}) : super(key: key);

  _MyCustomTransitionState createState() => _MyCustomTransitionState();
}

class _MyCustomTransitionState extends State<MyCustomTransition> {

  var duration = Duration(seconds: 1);
  var color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AnimatedDecorateBox(
        duration: duration,
        decoration: BoxDecoration(color: color),
        child: FlatButton(
          onPressed: () {
            setState(() {
               color = Colors.red;
            });
          },
          child: Text(
            "AnimatedDecoratedBox",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AnimatedDecorateBox extends ImplicitlyAnimatedWidget {
  AnimatedDecorateBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    Duration reverseDuration
  }) : super (
          key: key,
          curve: curve,
          duration: duration
          );

  final BoxDecoration decoration;
  final Widget child;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedDecorateBoxState();
  }
}

class _AnimatedDecorateBoxState extends AnimatedWidgetBaseState<AnimatedDecorateBox> {
  DecorationTween _decoration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _decoration = visitor(_decoration, widget.decoration, (value) => DecorationTween(begin: value));
  }
}

class AnimatedWidgetsTest extends StatefulWidget {
  @override
  _AnimatedWidgetsTestState createState() => _AnimatedWidgetsTestState();
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setState(() {
                _padding = 20;
              });
            },
            child: AnimatedPadding(
              duration: duration,
              padding: EdgeInsets.all(_padding),
              child: Text("AnimatedPadding"),
            ),
          ),
          SizedBox(
            height: 50,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: duration,
                  left: _left,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _left = 100;
                      });
                    },
                    child: Text("AnimatedPositioned"),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              duration: duration,
              alignment: _align,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    _align = Alignment.center;
                  });
                },
                child: Text("AnimatedAlign"),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _height = 150;
                  _color = Colors.blue;
                });
              },
              child: Text(
                "AnimatedContainer",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            child: GestureDetector(
              child: Text("hello world"),
              onTap: () {
                setState(() {
                  _style = TextStyle(
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.blue,
                  );
                });
              },
            ),
            style: _style,
            duration: duration,
          ),
        ].map((e) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: e,
          );
        }).toList(),
      ),
    );
  }
}