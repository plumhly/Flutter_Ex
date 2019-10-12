import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleScrollWidget extends StatelessWidget {
  const SingleScrollWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: string.split("").map((v) => Text(v)).toList(),
          ),
        ),
      ),
    );
  }
}