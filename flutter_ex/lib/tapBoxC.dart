import 'package:flutter/material.dart';

class ParentTapWidget extends StatefulWidget {
  ParentTapWidget({Key key}) : super(key: key);

  _ParentTapWidgetState createState() => _ParentTapWidgetState();
}

class _ParentTapWidgetState extends State<ParentTapWidget> {
  bool _active = false;

  void handle(value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxC(
      active: _active,
      onChange: handle,
    );
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active, @required this.onChange}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  var _hilight = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: this.tapDown,
      onTapUp: this.tapUp,
      onTap: this.handle,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? "Active" : "Inactive",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: _hilight ? Colors.lightGreen[700] : Colors.grey[600],
          border: _hilight ? Border.all(
            color: Colors.teal,
            width: 10
          ) : null
        ),
      ),
    );
  }

  void tapDown(detail) {
    setState(() {
      _hilight = true;
    });
  }

  void tapUp(detail) {
    setState(() {
      _hilight = false;
    });
  }

  void handle() {
    widget.onChange(!widget.active);
  }

}