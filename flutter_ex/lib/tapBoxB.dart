import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  ParentWidget({Key key}) : super(key: key);

  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void handle(value) {
    setState(() {
      _active = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TapBoxB(
      active: _active,
      onChange: handle,
    );
  }
}

class TapBoxB extends StatelessWidget {
  const TapBoxB({Key key, this.active, @required this.onChange}) : super(key: key);
  final bool active;
  final ValueChanged<bool> onChange;

  void handleTap() {
    this.onChange(!active);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? "Active" : "Inactive",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white
            ),
          ),
        ),
        width: 300,
        height: 300,
        color: active ? Colors.lightGreenAccent[700] : Colors.grey[600],
      ),
    );
  }
}