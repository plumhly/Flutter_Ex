import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {
  const TransformWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:BoxDecoration(color: Colors.red),
      child: Transform.scale(
          scale: 1, //放大到1.5倍
          // child: Text("Hello world",
          //   style: TextStyle(
          //     color: Colors.white
          //   ),
          // )
          child: RotatedBox(
            quarterTurns: 1,
            child: Text("会话"),
          ),
      )
    );
  }
}