import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

class FutureBuilderWidget extends StatelessWidget {
  const FutureBuilderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: mockNetworkData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Text("Connects: ${snapshot.data}");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}