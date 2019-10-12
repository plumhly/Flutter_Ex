import 'package:flutter/cupertino.dart';

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) => i);
}

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: counter(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("没有Stream");
              case ConnectionState.waiting:
                return Text("等待数据");
              case ConnectionState.active:
                return Text("Active: ${snapshot.data}");
              case ConnectionState.done:
                return Text("stream已经关闭");
            }
            return null;
          }
        },
      ),
    );
  }
}