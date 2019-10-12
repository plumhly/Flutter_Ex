

import 'package:flutter/material.dart';

class SwitchAndCheckBoxWidget extends StatefulWidget {
  SwitchAndCheckBoxWidget({Key key}) : super(key: key);

  _SwitchAndCheckBoxWidgetState createState() => _SwitchAndCheckBoxWidgetState();
}

class _SwitchAndCheckBoxWidgetState extends State<SwitchAndCheckBoxWidget> {
  bool _mySwitch = false;
  bool _myChecked = false;
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Container(
        child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Switch(
               value: _mySwitch,
               onChanged: (value) {
                 setState(() {
                   _mySwitch = value;
                 });
               },
             ),
             Checkbox(
               value: _myChecked,
               activeColor: Colors.red,
               onChanged: (value) {
                 setState(() {
                   _myChecked = value;
                 });
               },
             )
           ],
         ),
       ),
      )
    );
  }
}