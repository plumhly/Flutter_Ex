import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContaierWidget extends StatelessWidget {
  const ContaierWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 120),
        constraints: BoxConstraints.tightFor(
          width: 200,
          height: 150
        ),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.red, Colors.grey],
            center: Alignment.topLeft,
            radius: .98
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 4.0
            )
          ]
        ),
        transform: Matrix4.rotationZ(.2),
        alignment: Alignment.center,
        child: Text("5.2",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40
          ),
        ),
      ),
    );
  }
}