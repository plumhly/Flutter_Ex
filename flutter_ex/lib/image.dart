import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ex/myIcons.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String icon = "";
    icon += " \uE914";
    icon += " \uE000";
    icon += " \uE90D";
    return Container(
      child: Center(
        // child: Image(
          // image: AssetImage("images/image.png"),
          // image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
          // width: 100,
        // ),
        // child: Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        //   width: 100,
        // )
        // child: Text(
        //   icon,
        //   style: TextStyle(
        //     fontFamily: "MaterialIcons",
        //     fontSize: 24,
        //     color: Colors.green,
        //     decoration: null
        //   ),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.fingerprint, color: Colors.green),
            Icon(MyIcons.bread, color: Colors.white)
          ],
        ),
      ),
    );
  }
}