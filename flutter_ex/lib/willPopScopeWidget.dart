import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  WillPopScopeTestRoute({Key key}) : super(key: key);

  _WillPopScopeTestRouteState createState() => _WillPopScopeTestRouteState();
}

class _WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime time;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (time == null || DateTime.now().difference(time) > Duration(seconds:2)) {
          time = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        child: Center(
          child: Text("连续点击退出"),
        ),
      ),
    );
  }
}